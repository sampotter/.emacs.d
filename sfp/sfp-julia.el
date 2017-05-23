;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'julia-mode)
(install-package-if-necessary 'julia-shell)

(setq julia-shell-arguments (list "--color=yes")
	  julia-mode-hook (lambda () (set-input-method 'TeX)))

(provide 'sfp-julia)
;;; sfp-julia.el ends here
