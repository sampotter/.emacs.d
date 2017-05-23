;;; package --- Summary:
;;; Commentary:
;;; Code:

(set-default 'TeX-parse-self t)
(set-default 'TeX-auto-save t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(provide 'sfp-auctex)
;;; sfp-auctex.el ends here
