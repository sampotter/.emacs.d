;;; package --- Summary:

;;; Commentary:

;;; Code:

(setq-default TeX-auto-save t)
(setq-default TeX-parse-self t)
(setq-default TeX-master nil)

(install-package-if-necessary 'auctex)
(install-package-if-necessary 'latex-math-preview)

(load "auctex.el" nil t t)
(load "preview.el" nil t t)

(setq-default preview-scale-function 1)

(provide 'sfp-latex)
;;; sfp-latex.el ends here
