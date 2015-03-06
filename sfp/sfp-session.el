;;; package --- Summary:

;;; Commentary:

;;; Code:

(require 'session)

(when (require 'session nil t)
  (add-hook 'after-init-hook 'session-initialize)
  (add-to-list 'session-globals-exclude 'org-mark-ring))

(provide 'sfp-session)
;;; sfp-session.el ends here

