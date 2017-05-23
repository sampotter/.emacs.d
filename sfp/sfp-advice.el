;;; package --- Summary:
;;; Commentary:
;;; Code:

(defun hide-frame-advice (original-function &rest args)
  (message "bloop")
  (apply original-function args))

(do-applescript "tell application \"System Events\" to tell process \"Emacs\" to set visible to false")

(advice-add 'handle-delete-frame :around #'hide-frame-advice)

(provide 'sfp-advice)
;;; sfp-advice.el ends here
