(install-package-if-necessary 'slime)

(setq inferior-lisp-program (shell-command-to-string "which sbcl"))
(setq slime-contribs '(slime-fancy))

(provide 'sfp-lisp)
