;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'lsp-mode)

(require 'lsp-mode)

(add-hook 'c-mode-hook #'lsp)

(lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "ccls")
                     :major-modes '(c-mode c++-mode)
                     :remote? t
                     :server-id 'ccls-remote))

(provide 'sfp-lsp)
;;; sfp-lsp.el ends here
