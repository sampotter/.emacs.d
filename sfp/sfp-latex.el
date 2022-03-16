;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'auctex)
(install-package-if-necessary 'latex-math-preview)

(setq-default TeX-engine 'xetex)

(setq-default TeX-auto-save t)
(setq-default TeX-parse-self t)
(setq-default TeX-master nil)

(setq-default TeX-source-correlate-method 'synctex)
(setq-default TeX-source-correlate-mode t)
(setq-default TeX-source-correlate-start-server t)

(load "auctex.el" nil t t)
(load "preview.el" nil t t)

(setq-default preview-scale-function 1)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; ;; use Skim as default pdf viewer Skim's displayline is used for
;; ;; forward search (from .tex to .pdf) option -b highlights the current
;; ;; line; option -g opens Skim in the background
;; (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
;; (setq TeX-view-program-list '(("PDF Viewer" "displayline -b -g %n %o %b")))

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(provide 'sfp-latex)
;;; sfp-latex.el ends here
