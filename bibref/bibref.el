;;; Parsing

(require 'parsec)

(defmacro bibref/tok (parser)
  `(parsec-return ,parser
     (bibref/whitespace)))

(defun bibref/whitespace ()
  (parsec-many (parsec-or (parsec-ch ? )
						  (parsec-ch ?\n)
						  (parsec-ch ?\t))))

(defun bibref/symbol ()
  (parsec-or (parsec-ch ?-)
			 (parsec-ch ?:)))

(defun bibref/word ()
  (parsec-with-error-message "Failed to parse word"
	(parsec-many1-as-string (parsec-or (parsec-letter)
									   (parsec-digit)
									   (bibref/symbol)))))

(defun bibref/entry-type ()
  (parsec-with-error-message "Failed to parse entry type"
	(parsec-between (bibref/tok (parsec-ch ?@))
					(bibref/tok (parsec-ch ?{))
					(bibref/word))))

(defun bibref/cite-key ()
  (parsec-with-error-message "Failed to parse citation key"
	(parsec-return (bibref/word)
	  (parsec-optional (bibref/tok (parsec-ch ?,))))))

(defun bibref/field-key ()
  (parsec-with-error-message "Failed to parse field key"
	(bibref/word)))

(defun bibref/field-value ()
  (parsec-with-error-message "Failed to parse field value"
	(parsec-and (parsec-many-till (bibref/whitespace) (parsec-ch ?{))
				(parsec-many-till-s (parsec-any-ch) (parsec-ch ?})))))

(defun bibref/field ()
  (parsec-with-error-message "Failed to parse field"
	  (cons (bibref/field-key)
			(parsec-and (bibref/whitespace)
						(parsec-ch ?=)
						(bibref/whitespace)
						(bibref/field-value)))))

(defun bibref/fields ()
  (parsec-with-error-message "Failed to parse entry's fields"
	(parsec-sepby (bibref/field)
				  (bibref/tok (parsec-ch ?,)))))

(defun bibref/entry ()
  (let ((parsed (list (cons "entry-type" (bibref/entry-type))
					  (cons "cite-key" (bibref/cite-key))
					  (cons "fields" (bibref/fields)))))
	(bibref/tok (parsec-ch ?}))
	parsed))

(defun bibref/parse-entry (input)
  (parsec-with-input input
	(bibref/whitespace)
	(bibref/entry)))

(defun bibref/parse-entries (input)
  (parsec-with-input input
	(parsec-and
	 (bibref/whitespace)
	 (parsec-sepby (bibref/entry)
				   (bibref/whitespace)))))

;;; bibref-mode

(defvar bibref-mode-map
  (let ((map (make-sparse-keymap)))
	(define-key map (kbd "C-c C-j") (lambda ()
									  (interactive)
									  (message "hi!")))
	map))

(defun bibref/init-entries-table ()
  (interactive)
  (let* ((input (buffer-substring-no-properties (point-min) (point-max)))
		 (entries (bibref/parse-entries input))
		 (entries-table (make-hash-table :test 'equal)))
	(print entries)
	(dolist (entry entries entries-table)
	  (let ((cite-key (cdr (assoc entry "cite-key"))))
		(puthash cite-key
				 (assoc-delete-all "cite-key" entry)
				 entries-table)))))

(define-derived-mode bibref-mode special-mode
  "bibref"
  "A major mode for managing bibliographic references stored in a
  BibTeX file."
  (use-local-map bibref-mode-map)
  (make-local-variable 'bibref/entries-table)
  (setq bibref/entries-table (bibref/init-entries-table)))

(provide 'bibref)
