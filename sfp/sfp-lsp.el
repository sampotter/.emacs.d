;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'lsp-mode)

(require 'lsp-mode)

(add-hook 'c-mode-hook #'lsp)

(provide 'sfp-lsp)
;;; sfp-lsp.el ends here
