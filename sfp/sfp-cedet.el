(load-file "~/.emacs.d/el/cedet/cedet-devel-load.el")

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

(provide 'sfp-cedet)
