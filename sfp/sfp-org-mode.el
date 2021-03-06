;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'htmlize)
(install-package-if-necessary 'org-bullets)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "C-c M-n") 'org-move-item-down)
(global-set-key (kbd "C-c M-p") 'org-move-item-up)

(when *sfp-dropbox-dir*
  (setq org-directory
	(file-name-as-directory (concat *sfp-dropbox-dir* "/org")))
  (setq org-default-notes-file (concat org-directory "/capture.org")))

(setq org-capture-templates
  '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
	 "* TODO %?\n")
	("j" "Journal" entry (file+headline org-default-notes-file "Journal")
	 "* %?\n")))

(setq org-html-preamble nil)
(setq org-html-postamble nil)
(setq org-export-with-toc nil)
(setq org-export-with-author nil)

(setq org-hide-emphasis-markers t)

(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-]\\) "
	(0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(let* ((variable-tuple
        (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(custom-theme-set-faces
 'user
 '(variable-pitch
   ((t (:family "Source Sans Pro" :height 160 :weight regular)))))

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(setq-default org-format-latex-options
			  '(:foreground default
				:background default
				:scale 1.3
				:matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))

(require 'ox-md)

(provide 'sfp-org-mode)
;;; sfp-org-mode.el ends here
