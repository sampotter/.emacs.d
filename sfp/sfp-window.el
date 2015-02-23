(defvar theme-packages
  (list 'ample-zen-theme
	'assemblage-theme
	'bubbleberry-theme
	'clues-theme
	'deep-thought-theme
	'django-theme
	'flatland-theme
	'gandalf-theme
	'github-theme
	'heroku-theme
	'ir-black-theme
	'jujube-theme
	'monokai-theme
	'nzenburn-theme
	'pastels-on-dark-theme
	'purple-haze-theme
	'qsimpleq-theme
	'sea-before-storm-theme
	'solarized-theme
	'soothe-theme
	'steady-theme
	'tango-2-theme
	'tommyh-theme
	'toxi-theme
	'tron-theme
	'tronesque-theme
	'twilight-theme
	'ujelly-theme
	'zen-and-art-theme
	'zenburn-theme)
  "List of packages for each theme that we would like to have available.")

(dolist (package theme-packages)
  (condition-case nil
      (install-package-if-necessary package)
    (error nil)))

(load-theme 'whiteboard t)
; (load-theme 'assemblage t)

; (set-default-font "Monospace-12")
; (setf font-use-system-font t)

(mapcar (lambda (pair) (add-to-list 'default-frame-alist pair))
	(list '(width . 80)
	      '(height . 24)))

(provide 'sfp-window)
