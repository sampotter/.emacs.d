(install-package-if-necessary 'company)

(global-company-mode 1)

(global-set-key (kbd "M-SPC") #'company-complete)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)

(provide 'sfp-company)
