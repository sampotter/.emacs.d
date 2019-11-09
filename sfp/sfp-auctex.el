;;; package --- Summary:
;;; Commentary:
;;; Code:

(set-default 'TeX-parse-self t)
(set-default 'TeX-auto-save t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
	  TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(provide 'sfp-auctex)
;;; sfp-auctex.el ends here
