;;; package --- Summary:
;;; Commentary:
;;; Code:

(defun join-with-separator (elts sep)
  "Splice together ELTS using the separator SEP."
  (let ((joined nil))
	(dolist (elt elts joined)
	  (setq joined (if (null joined)
					   elt
					 (concatenate (type-of sep) joined sep elt))))))

(defun spacep (input)
  "Return whether INPUT consists of whitespace."
  (pcase (type-of input)
	(`integer (not (null (string-match "[[:space:]]" (char-to-string input)))))
	(`string (not (null (string-match "^[[:space:]]*$" input))))
	(_ (error "Input has invalid type"))))

(defun empty-string (string)
  "Return whether STRING is the empty string."
  (string-equal string ""))

(defun get-opposite-paren-char (paren-char)
  "Get the 'paren' character opposite PAREN-CHAR.

Supports (, <, [, { and their opposites.  If PAREN-CHAR is not one
of these characters, then return the same character.  If
PAREN-CHAR is whitespace, return nil."
  (cl-block nil
	(when (null paren-char)
	  (return nil))
	(unless (typep paren-char 'integer)
	  (error "Type of input must be integer"))
	(pcase paren-char
	 (?\( ?\))
	 (?\) ?\()
	 (?< ?>)
	 (?> ?<)
	 (?[ ?])
	 (?{ ?})
	 ((pred spacep) nil)
	 (_ paren-char))))

(defun insert-array ()
  "Interactively insert an array of entries with a delimiter."
  (interactive)
  (let* ((paren-string (read-from-minibuffer "Paren character: "))
		 (paren-char (string-to-char paren-string))
		 (opposite-paren-char (get-opposite-paren-char paren-char))
		 (separator (read-from-minibuffer "Separator: "))
		 (element-strings '()))
	(let* ((prompt "Array element (enter to terminate): ")
		   (element-string (read-from-minibuffer prompt)))
	  (while (not (empty-string element-string))
		(push element-string element-strings)
		(message element-string)
		(setq element-string (read-from-minibuffer prompt)))
	  (setq element-strings (reverse element-strings)))
	(insert (concat (char-to-string paren-char)
					(join-with-separator element-strings separator)
					(char-to-string opposite-paren-char)))))

(defun wrap-with-preprocessor-if ()
  "Wrap the current region or line with a C-style preprocessor macro."
  (interactive)
  (let* ((prompt "Preprocessor if clause: ")
		 (clause-string (read-from-minibuffer prompt))
		 (p1 (if (region-active-p)
				 (region-beginning)
			   (line-beginning-position)))
		 (p2 (if (region-active-p)
				 (region-end)
			   (line-end-position))))
	(goto-char (point-min))
	(let* ((regex "^[[:space:]]*#[[:space:]]*[a-z]+")
		   (search-pos (search-forward-regexp regex))
		   (search-line (line-number-at-pos search-pos)))
	  (while search-pos
		(message (format "%d" search-pos))
		(save-excursion
		  (forward-line (1- search-line))
		  (beginning-of-line nil)
		  (forward-char)
		  (insert "   "))
		(goto-char search-pos)
		(setf search-pos (search-forward-regexp regex))
		(setf search-line (line-number-at-pos search-pos))))
	(save-excursion
	  (save-excursion
		(let ((p2-line (line-number-at-pos p2)))
		  (when (= (line-beginning-position p2-line) p2)
			(decf p2-line))
		  (forward-line p2-line))
		(beginning-of-line nil)
		(open-line 1)
		(insert "#endif"))
	  (save-excursion
		(forward-line (1- (line-number-at-pos p1)))
		(beginning-of-line nil)
		(open-line 1)
		(insert (concat "#if " clause-string))))))

(provide 'sfp-text-editing)
;;; sfp-text-editing.el ends here
