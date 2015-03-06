;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'company)

(global-company-mode 1)

(global-set-key (kbd "M-SPC") #'company-complete)

(semantic-mode 1)

(provide 'sfp-company)
;;; sfp-company.el ends here
