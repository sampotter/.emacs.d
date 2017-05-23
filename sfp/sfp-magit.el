;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'magit)

(add-hook 'magit-mode-hook
		  (lambda ()
			(defvar magit-mode-map nil) ; prevent a warning when byte-compiled
			(dolist (func-numkey-assoc '((magit-section-show-level-1-all . 1)
										 (magit-section-show-level-2-all . 2)
										 (magit-section-show-level-3-all . 3)
										 (magit-section-show-level-4-all . 4)))
			  (let ((numkey-string (number-to-string (cdr func-numkey-assoc))))
				(define-key
				  magit-mode-map
				  (read-kbd-macro (concat "M-" numkey-string))
				  nil)
				(define-key
				  magit-mode-map
				  (read-kbd-macro (concat "s-" numkey-string))
				  (car func-numkey-assoc))))))

;; (global-set-key (kbd "C-x g") 'magit-status) ; not really using this...

(setq vc-handled-backends (delq 'Git vc-handled-backends))

(provide 'sfp-magit)
;;; sfp-magit.el ends here
