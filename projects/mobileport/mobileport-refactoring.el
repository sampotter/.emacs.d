;;; package --- Summary:
;;; Commentary:
;;; Code:

;;; General idea for adding error output for Alex:
;;;
;;; 1. create a macro that will iterate over each of the wrapper definitions
;;;    by using M-S-[, selecting each wrapper definition it encounters with
;;;    a region, copying and pasting it into another buffer, and then doing
;;;    operating on what was pasted in the buffer
;;; 2. in the output buffer, do the following on each pasted wrapper
;;;    definition:
;;;    a. narrow-wrapper-... to extract the relevant lines, including preproc
;;;       conditionals
;;;    b. shift-funkily-... to get it lined up correctly (TODO: need to get this
;;;       function to ignore preproc directives, probably)
;;;    c. replace-error-... to replace what we
;;;
;;; TODO: Okay, the above works. Now we need to fix a few corner cases,
;;; exemplified by these ones that failed to convert properly.
;;;
;;; 1. BufferDataError
;;; 2. FramebufferStatus (probably multiple issues)
;;; 3. ClearDepthError
;;; 4. CreateProgramError
;;; ...
;;;
;;; TODO: Some of the problems are just with the preprocessor macros not
;;; being laid out ideally for what we're trying to do. Here are some that
;;; need fixing. Basically, we don't want to have multiple wrapper functions
;;; wrapped by the same preprocessor conditional. This makes things harder
;;; to deal with, since we would need some way of determining that the
;;; preprocessor conditional contained multiple wrapper functions.
;;;
;;; 1. EnableClientStateError
;;; 2. Color* wrappers
;;; ...

(defun inclusive-range (i j)
  "Return a list containing the values I, I+1, ..., J."
  (cond ((= i j) `(,i))
		(t (cons i (inclusive-range (1+ i) j)))))

(defun empty-line ()
  "Determine if the current line is empty."
  (save-excursion
	(let (p1 p2)
	  (move-beginning-of-line nil)
	  (setq p1 (point))
	  (move-end-of-line nil)
	  (setq p2 (point))
	  (equal p1 p2))))

(defun remove-lines-if (predicate)
  "Remove lines in the active region for which PREDICATE is true."
  (when (region-active-p)
	(let ((p1 (region-beginning))
		  (p2 (region-end)))
	  (let (first-line last-line)
		(goto-char p1)
		(save-excursion
		  (setq first-line (line-number-at-pos))
		  (goto-char p2)
		  (setq last-line (line-number-at-pos)))
		(dolist (line-num (reverse (inclusive-range first-line last-line)))
		  (save-excursion
			(goto-char (point-min))
			(forward-line (1- line-num))
			(when (funcall predicate)
			  (unless (empty-line) (kill-line))
			  (kill-line))))))))

(defun narrow-wrapper-function-declaration-to-enum-class-and-macros (p1 p2)
  "Narrow the region to the contained enum class and any preprocessor macros.

Given a region (between P1 and P2) containing an enum class
definition that is sprinkled with preprocessor conditionals,
remove all of the lines except for the lines containing
preprocessor conditionals and the enum class definition."
  (interactive "r")
  ;; Find enum class definition start and end lines.
  (let (wrapper-def-beginning-line
		wrapper-def-end-line
		enum-class-beginning-line
		enum-class-end-line)
	;; Get region line range:
	(save-excursion
	  (goto-char p1)
	  (search-forward "enum class")
	  (setq wrapper-def-beginning-line (line-number-at-pos))
	  (search-forward ");")
	  (setq wrapper-def-end-line (line-number-at-pos)))
	;; Get enum class line range:
	(save-excursion
	  (goto-char p1)
	  (search-forward-regexp "^[[:space:]]+enum[[:space:]]+class[[:space:]]+[[:alnum:]]+[[:space:]]+{[[:space:]]*$")
	  (setq enum-class-beginning-line (line-number-at-pos))
	  (search-forward-regexp "};")
	  (setq enum-class-end-line (line-number-at-pos)))
	(remove-lines-if #'(lambda ()
						 (and (not (and (or (equal (char-after) ?#)
											(<= enum-class-beginning-line
												(line-number-at-pos)
												enum-class-end-line))))
							  (<= wrapper-def-beginning-line
								  (line-number-at-pos)
								  wrapper-def-end-line))))))

(defun shift-funkily-indented-enum-class-left (p1 p2)
  "Try to unindent the enum class definition in the region between P1 and P2.
This takes into account that the enum class is inconsistently indented in
terms of whether the indentation consists of tabs or spaces.  The function
also ignores preprocessor macros and empty lines."
  (interactive "r")
  (goto-char p1)
  (save-excursion
	(tabify p1 p2))
  (save-excursion
	(let* ((end-point (search-forward "};"))
		   (num-lines (count-lines p1 end-point)))
	  (goto-char p1)
	  (move-beginning-of-line nil)
	  (dotimes (line num-lines)
		(unless (or (empty-line)
					(equal (char-after (point)) ?#))
		  (delete-char 1))
		(when (< line num-lines)
		  (forward-line)))))
  (save-excursion
	(let ((end-point (search-forward "};")))
	  (goto-char p1)
	  (untabify p1 end-point))))

(defun get-enum-class-name-from-line ()
  "Get the name of an enum class from the first line of its definition."
  (interactive)
  (let (enum-class-name-beginning
		enum-class-name-end)
	(save-excursion
	  (move-beginning-of-line nil)
	  (unless (setq enum-class-name-beginning
					(search-forward "enum class " (line-end-position) t))
		(error "Failed to find beginning of enum class name"))
	  (move-end-of-line nil)
	  (unless (setq enum-class-name-end
					(search-backward " {" (line-beginning-position) t))
		(error "Failed to find end of enum class name")))
	(buffer-substring enum-class-name-beginning enum-class-name-end)))

(defun replace-error-enum-class-with-operator<< (p1 p2)
  "Replace an enum class definition with an operator<< definition.
Converts the enum class definition contained in the region
delimited by P1 and P2 into an operator<< definition that takes a
std::ostream and an instance of the enum class itself, for the
purposes of string conversion.  Ensure that preprocessor macros
are appropriately incorporated into the operator<< definition."
  (interactive "r")
  (goto-char p1)
  (let (enum-class-name
		enum-class-def-beginning-line
		enum-class-def-end-line)
	(save-excursion
	  (search-forward "enum class ")
	  (setq enum-class-name (get-enum-class-name-from-line))
	  (setq enum-class-def-beginning-line (line-number-at-pos)))
	(save-excursion
	  (search-forward "};")
	  (setq enum-class-def-end-line (line-number-at-pos)))
	(save-excursion
	  (goto-char (point-min))
	  (save-excursion
		(forward-line (1- enum-class-def-end-line))
		(open-line 1)
		(insert "    }"))
	  (let ((l1 enum-class-def-beginning-line)
			(l2 enum-class-def-end-line))
		(dolist (line (reverse (inclusive-range (1+ l1) (1- l2))))
		  (save-excursion
			(forward-line (1- line))
			(unless (equal (char-after) ?#)
			  (let (error-name)
				(save-excursion
				  (let (p1 p2)
					(skip-chars-forward "[:space:]")
					(setq p1 (point))
					(move-end-of-line nil)
					(search-backward ",")
					(setq p2 (point))
					(setq error-name (buffer-substring p1 p2))))
				(kill-line)
				(insert (format "    case %s::%s:" enum-class-name error-name))
				(newline)
				(insert (format "        return ostream << \"%s::%s\";"
								enum-class-name
								error-name)))))))
	  (save-excursion
		(forward-line (1- enum-class-def-beginning-line))
		(kill-line)
		(insert (format "std::ostream & VGM::GL::operator<<(std::ostream & ostream, %s const & error) {"
						enum-class-name))
		(newline)
		(insert (format "    switch (error) {"))))))

(defun wrapper-function-definition-to-operator<< (p1 p2)
  "Replace a GLWrapper function definition with an appropriate operator<<.
Operate on the region delimited by P1 and P2."
  (interactive "r")
  (let ((point-max-before (point-max)))
	(save-excursion
	  (narrow-wrapper-function-declaration-to-enum-class-and-macros p1 p2))
	(incf p2 (- (point-max) point-max-before)))
  (let ((point-max-before (point-max)))
	(save-excursion
	  (shift-funkily-indented-enum-class-left p1 p2))
	(incf p2 (- (point-max) point-max-before)))
  (save-excursion
	(replace-error-enum-class-with-operator<< p1 p2)))
	
(provide 'mobileport-refactoring)
;;; mobileport-refactoring.el ends here
