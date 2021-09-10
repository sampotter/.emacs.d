;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'slime)
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)

(setq inferior-lisp-program "sbcl")

(install-package-if-necessary 'slime-company)
(slime-setup '(slime-company))

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
