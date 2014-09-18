(mapcar (lambda (args) (apply #'global-set-key args))
	(list (list (kbd "C-S-l") 'recenter-left-right)))

(provide 'sfp-keybindings)
