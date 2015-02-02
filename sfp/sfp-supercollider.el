(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/SuperCollider")

(require 'sclang)

(setf sclang-auto-scroll-post-buffer t
      sclang-eval-line-forward t)

(provide 'sfp-supercollider)
