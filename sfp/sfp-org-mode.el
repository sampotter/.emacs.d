;;; package --- Summary:

;;; Commentary:

;;; Code:

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "C-c M-n") 'org-move-item-down)
(global-set-key (kbd "C-c M-p") 'org-move-item-up)

(defvar org-directory "~/Dropbox/org")
(defvar org-default-notes-file (concat org-directory "/capture.org"))

(provide 'sfp-org-mode)
;;; sfp-org-mode.el ends here
