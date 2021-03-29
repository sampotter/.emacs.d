;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'lsp-mode)

(require 'lsp-mode)

(setq lsp-clients-clangd-executable "/opt/local/libexec/llvm-11/bin/clangd")

(add-hook 'c-mode-hook #'lsp)

(provide 'sfp-lsp)
;;; sfp-lsp.el ends here
