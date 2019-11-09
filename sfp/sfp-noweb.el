;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'poly-markdown)
(install-package-if-necessary 'poly-noweb)

; From:
; https://stackoverflow.com/questions/52489905/emacs-polymode-for-markdown-and-python

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

(add-to-list 'auto-mode-alist '("\\.pymd" . poly-pweave-mode))

(provide 'sfp-noweb)
;;; sfp-noweb.el ends here
