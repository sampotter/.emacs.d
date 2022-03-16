;;; package --- Summary:

;;; Commentary:

;;; Code:

;; Get rid of extra GUI widgets.
(fringe-mode '(1 . 1)) ; minimal
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(install-package-if-necessary 'base16-theme)

(defvar *light-theme* 'base16-classic-light)
(defvar *dark-theme* 'base16-classic-dark)
(defvar *default-theme* *light-theme*)
(defvar *current-theme* nil)

(when window-system
  (defun change-theme (new-theme)
	(interactive)
	(when *current-theme*
	  (disable-theme *current-theme*))
	(setq *current-theme* new-theme)
	(when new-theme
	  (load-theme new-theme t)))
  (defun light-theme ()
	(interactive)
	(change-theme *light-theme*))
  (defun dark-theme ()
	(interactive)
	(change-theme *dark-theme*))
  (cond
   ((window-system-is-mac)
	(set-frame-font "Menlo 14" :frames t))
   ((window-system-is-x)
	(set-frame-font "Monospace 12" :frames t))
   (t (error "Unknown window system when setting font")))
  (cond
   ((eq *default-theme* *light-theme*) (light-theme))
   ((eq *default-theme* *dark-theme*) (dark-theme))
   ((eq *default-theme* *light-color-theme*) (light-color-theme))
   ((eq *default-theme* *dark-color-theme*) (dark-color-theme))
   (t (error "Invalid default theme"))))

(mapc (lambda (pair) (add-to-list 'default-frame-alist pair))
      (list '(width . 80)
            '(height . 24)))

(provide 'sfp-window)
;;; sfp-window.el ends here
