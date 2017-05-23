;;; package --- Summary:
;;; Commentary:
;;; Code:

(when (system-type-is-darwin)
  (setf mac-command-modifier 'super)
  (setf mac-option-modifier 'meta))

(provide 'sfp-osx)
;;; sfp-osx.el ends here
