;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'slime)

(add-to-list 'load-path (concat *sfp-emacs-dir* "el/slime"))
(require 'slime-autoloads)
(setq slime-contribs '(slime-fancy)
	  slime-net-coding-system 'utf-8-unix)

(install-package-if-necessary 'slime-company)
(slime-setup '(slime-company))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up the list of implementations.

(setq slime-lisp-implementations
	  (cl-labels ((get-lisp-path (cmd-name)
							  (trim-string (shell-command-to-string cmd-name))))
		(let ((ccl-path (get-lisp-path "which ccl64"))
			  (quicklisp-path (concat *sfp-dropbox-dir* "quicklisp.lisp"))
			  (sbcl-path (get-lisp-path "which sbcl")))
		  `((ccl64 (,ccl-path "--load" ,quicklisp-path))
			(sbcl (,sbcl-path "--load" ,quicklisp-path)
				  :coding-system utf-8-unix)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use paredit-mode.

(install-package-if-necessary 'paredit)

(autoload 'enable-paredit-mode "paredit" "Turn on paredit-mode." t)

(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook #'enable-paredit-mode)

(provide 'sfp-lisp)
;;; sfp-lisp.el ends here
