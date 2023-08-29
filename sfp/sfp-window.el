;;; package --- Summary:

;;; Commentary:

;;; Code:

;; Get rid of extra GUI widgets.
(fringe-mode '(1 . 1)) ; minimal
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(install-package-if-necessary 'base16-theme)

(defvar *light-theme* 'base16-dirtysea)
(defvar *dark-theme* 'base16-classic-dark)
(defvar *default-theme* *light-theme*)
(defvar *current-theme* nil)

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

(defvar first-frame-has-been-created nil
  "Whether the first frame has been created. Used in
SET-FONTS-AND-THEMES to test whether we should set the font and
theme when running Emacs as a daemon.")

(defun set-fonts-and-themes ()
  (cond
   ((window-system-is-mac)
	(set-frame-font "Menlo 14" :frames t))
   ((or (window-system-is-pgtk) (window-system-is-x))
	(set-frame-font "Comic Code 11" :frames t))
   (t (error "Unknown window system when setting font")))
  (cond
   ((eq *default-theme* *light-theme*) (light-theme))
   ((eq *default-theme* *dark-theme*) (dark-theme))
   ((eq *default-theme* *light-color-theme*) (light-color-theme))
   ((eq *default-theme* *dark-color-theme*) (dark-color-theme))
   (t (error "Invalid default theme"))))

(defun set-fonts-and-themes--daemon (frame)
  (unless first-frame-has-been-created
	(setq first-frame-has-been-created t)
	(select-frame frame)
	(set-fonts-and-themes)))

(if (daemonp)
	(add-hook 'after-make-frame-functions #'set-fonts-and-themes--daemon)
  (set-fonts-and-themes))

(mapc (lambda (pair) (add-to-list 'default-frame-alist pair))
      (list '(width . 80)
            '(height . 24)))

(provide 'sfp-window)
;;; sfp-window.el ends here
