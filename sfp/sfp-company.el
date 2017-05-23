;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'company)
(install-package-if-necessary 'company-irony)

(global-company-mode 1)

(global-set-key (kbd "M-SPC") #'company-complete)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(semantic-mode 1)

(provide 'sfp-company)
;;; sfp-company.el ends here
