;;; package --- Summary:

;;; Commentary:

;;; Code:

(defvar *keybinding-list*
  (list
   (list (kbd "C-S-l") 'recenter-left-right)
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
		       (window-number-select 10)))))

(mapcar (lambda (args) (apply #'global-set-key args))
	*keybinding-list*)

(provide 'sfp-keybindings)
;;; sfp-keybindings.el ends here
