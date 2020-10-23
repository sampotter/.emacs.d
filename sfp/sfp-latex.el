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

(add-hook 'LaTeX-mode-hook
		  (lambda ()
			(push
			 '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
			   :help "Run latexmk on file")
			 TeX-command-list)))
(add-hook 'TeX-mode-hook
		  '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer Skim's displayline is used for
;; forward search (from .tex to .pdf) option -b highlights the current
;; line; option -g opens Skim in the background
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list '(("PDF Viewer" "displayline -b -g %n %o %b")))

(provide 'sfp-latex)
;;; sfp-latex.el ends here
