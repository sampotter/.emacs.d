;;; Commentary:

;;; Code:

(defun followed-by (cases)
  (cond ((null cases) nil)
        ((assq (car cases) 
               (cdr (memq c-syntactic-element c-syntactic-context))) t)
        (t (followed-by (cdr cases)))))

(setq load-path
      (append (list "~/Build/cc-mode-cc-mode")
              load-path))

(c-add-style
 "sfp"
 '((c-offsets-alist (innamespace . 0))))

(setq c-default-style "sfp")

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/rtags")
(require 'rtags)

(provide 'sfp-cc-mode)
;;; sfp-cc-mode.el ends here
