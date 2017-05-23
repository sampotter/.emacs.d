;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'opencl-mode)
(require 'opencl-mode)
(add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

(provide 'sfp-opencl)
;;; sfp-opencl.el ends here
