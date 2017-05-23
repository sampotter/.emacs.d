;;; package --- Summary:
;;; Commentary:
;;; Code:

;; (setf scheme-program-name "csi")
;; (setf scheme-program-name "petite")
;; (setf scheme-program-name "chibi-scheme")
(setf scheme-program-name "scheme")

; (install-package-if-necessary 'geiser)
(install-package-if-necessary 'quack)
(install-package-if-necessary 'scheme-here)

; (require 'geiser)
; (require 'quack)
(require 'scheme-here)

(add-to-list 'auto-mode-alist '("\\.sld\\'" . scheme-mode))

(add-hook 'inferior-scheme-mode-hook 'paredit-mode t)

(defun scheme-add-keywords (face-name keyword-rules)
  (let* ((keyword-list (mapcar #'(lambda (x)
								   (symbol-name (cdr x)))
							   keyword-rules))
		 (keyword-regexp (concat "(\\("
								 (regexp-opt keyword-list)
								 "\\)[ \n]")))
	(font-lock-add-keywords 'scheme-mode
							`((,keyword-regexp 1 ',face-name))))
  (mapc #'(lambda (x)
			(put (cdr x)
				 'scheme-indent-function
				 (car x)))
		keyword-rules))

(scheme-add-keywords 'font-lock-keyword-face
					 '((1 . key-lambda)
					   (0 . define-c)
					   (0 . define-c-type)
					   (0 . define-c-struct)
					   (2 . let-keywords)))

(provide 'sfp-scheme)
;;; sfp-scheme.el ends here
