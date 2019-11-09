;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'conda)

(require 'conda)

(conda-env-initialize-interactive-shells)
(conda-env-initialize-eshell)
(conda-env-autoactivate-mode t)

(custom-set-variables '(conda-anaconda-home "/miniconda3"))

(provide 'sfp-conda)
;;; sfp-conda.el ends here
