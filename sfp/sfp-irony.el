;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'irony)
(install-package-if-necessary 'irony-eldoc)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(provide 'sfp-irony)
;;; sfp-irony.el ends here
