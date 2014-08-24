(add-to-list 'load-path "~/Build/slime")

(require 'slime-autoloads)

(setq inferior-lisp-program (shell-command-to-string "which sbcl"))
(setq slime-contribs '(slime-fancy))

(provide 'sfp-lisp)
