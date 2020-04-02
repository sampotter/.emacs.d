;;; package --- Summary:

;;; Commentary:

;;; Code:

;; Get rid of extra GUI widgets.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(mapc #'install-package-if-necessary
	  '(base16-theme
		avk-emacs-themes
		eink-theme
		greymatters-theme
		leuven-theme
		monochrome-theme
		peacock-theme
		phoenix-dark-mono-theme
		punpun-theme
		solarized-theme
		tao-theme
		ubuntu-theme))

(defvar *light-theme* 'base16-atelier-dune-light)
(defvar *dark-theme* 'base16-atelier-dune)
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
	(set-frame-font "Source Code Pro 12" :frames t))
   ((window-system-is-x)
	(set-frame-font "Ubuntu Mono" :frames t))
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
