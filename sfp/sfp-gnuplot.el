;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'gnuplot)

(autoload 'gnuplot-mode "gnuplot" "Gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

(provide 'sfp-gnuplot)
;;; sfp-gnuplot.el ends here
