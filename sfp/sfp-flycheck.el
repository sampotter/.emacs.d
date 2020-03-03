;;; package --- Summary:

;;; Commentary:

;;; Code:

; (require 'sfp-rtags)

(install-package-if-necessary 'flycheck)
(install-package-if-necessary 'flycheck-irony)
; (install-package-if-necessary 'flycheck-rtags)

;; (defun sfp/flycheck-rtags-setup ()
;;   "Configure flycheck-rtags for better experience."
;;   (interactive)
;;   (flycheck-select-checker 'rtags)
;;   (setq-local flycheck-check-syntax-automatically nil)
;;   (setq-local flycheck-highlighting-mode nil))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; (add-hook 'c-mode-hook #'sfp/flycheck-rtags-setup)
;; (add-hook 'c++-mode-hook #'sfp/flycheck-rtags-setup)
;; (add-hook 'objc-mode-hook #'sfp/flycheck-rtags-setup)

(provide 'sfp-flycheck)
;;; sfp-flycheck.el ends here
