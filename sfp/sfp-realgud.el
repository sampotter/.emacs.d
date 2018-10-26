;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'realgud)
(install-package-if-necessary 'test-simple)

(require 'realgud)
(require 'test-simple)

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/lldb")

(require 'realgud-lldb)

(defun eshell/lldb (&rest args)
  (realgud:lldb "lldb" (pop args)))

(provide 'sfp-realgud)
;;; sfp-realgud.el ends here
