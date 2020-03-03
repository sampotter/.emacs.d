;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'poly-markdown)
(install-package-if-necessary 'poly-noweb)

(require 'poly-noweb)
(require 'poly-markdown)

(defcustom pm-inner/noweb-python
  (clone pm-inner/noweb
         :name "noweb-python"
         :mode 'python-mode)
  "Noweb for Python"
  :group 'poly-innermodes
  :type 'object)

(define-polymode poly-pweave-mode poly-markdown-mode
  :innermodes '(pm-inner/noweb-python :inherit))

(provide 'sfp-poly)
;;; sfp-poly.el ends here
