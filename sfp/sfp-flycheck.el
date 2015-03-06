;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'sfp-flycheck)
;;; sfp-flycheck.el ends here
