;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'htmlize)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "C-c M-n") 'org-move-item-down)
(global-set-key (kbd "C-c M-p") 'org-move-item-up)

(defvar org-directory (concat *sfp-dropbox-dir* "/org"))
(defvar org-default-notes-file (concat org-directory "/capture.org"))

(setq org-capture-templates
  '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
	 "* TODO %?\n")
	("j" "Journal" entry (file+headline org-default-notes-file "Journal")
	 "* %?\n")))

(setq org-html-preamble nil)
(setq org-html-postamble nil)
(setq org-export-with-toc nil)
(setq org-export-with-author nil)

(require 'ox-md)

(provide 'sfp-org-mode)
;;; sfp-org-mode.el ends here
