(install-package-if-necessary 'slime)
(install-package-if-necessary 'paredit) 

(setq inferior-lisp-program (shell-command-to-string "which sbcl"))
(setq slime-contribs '(slime-fancy))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn on paredit-mode automatically.

(autoload 'enable-paredit-mode "paredit" "Turn on paredit-mode." t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)

(provide 'sfp-lisp)

