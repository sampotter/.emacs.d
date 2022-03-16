;;; package --- Summary:

;;; Commentary:

;;; Code:

(when (system-type-is-darwin)
  (setf mac-command-modifier 'super)
  (setf mac-option-modifier 'meta))

(defvar *keybinding-list*
  (list
   ;; Better compilation
   (list (kbd "<f5>") (lambda ()
						(interactive)
						(setq-local compilation-read-command nil)
						(call-interactively 'compile)))
   ;; Revert a file without the annoying confirmation
   (list (kbd "<f6>") 'revert-buffer-no-confirm)
   ;; LR recentering
   (list (kbd "C-S-l") 'recenter-left-right)
   ;; Hack to get window select to work
   (list (kbd "M-1") (lambda ()
		       (interactive)
		       (window-number-select 1)))
   (list (kbd "M-2") (lambda ()
		       (interactive)
		       (window-number-select 2)))
   (list (kbd "M-3") (lambda ()
		       (interactive)
		       (window-number-select 3)))
   (list (kbd "M-4") (lambda ()
		       (interactive)
		       (window-number-select 4)))
   (list (kbd "M-5") (lambda ()
		       (interactive)
		       (window-number-select 5)))
   (list (kbd "M-6") (lambda ()
		       (interactive)
		       (window-number-select 6)))
   (list (kbd "M-7") (lambda ()
		       (interactive)
		       (window-number-select 7)))
   (list (kbd "M-8") (lambda ()
		       (interactive)
		       (window-number-select 8)))
   (list (kbd "M-9") (lambda ()
		       (interactive)
		       (window-number-select 9)))
   (list (kbd "M-0") (lambda ()
		       (interactive)
		       (window-number-select 10)))
   (list (kbd "<f9>") (lambda ()
			(interactive)
			(toggle-frame-fullscreen)))
   (list (kbd "s-m") #'suspend-frame)
   (list (kbd "s-n") #'make-frame)
   (list (kbd "s-w") #'delete-frame)
   (list (kbd "s-c") #'kill-ring-save)
   (list (kbd "s-v") #'yank)
   (list (kbd "s-x") #'kill-region)
   (list (kbd "C-x C-o") #'ff-find-other-file)))

(dolist (keybinding *keybinding-list*)
  (apply #'global-set-key keybinding))

(provide 'sfp-keybindings)
;;; sfp-keybindings.el ends here
