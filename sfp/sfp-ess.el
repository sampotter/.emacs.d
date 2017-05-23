;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'ess)

(require 'ess-site)

(define-key comint-mode-map (kbd "M-P") 'previous-error)
(define-key comint-mode-map (kbd "M-N") 'next-error)

(setq ess-julia-post-run-hook (lambda () (set-input-method 'TeX)))

(provide 'sfp-ess)
;;; sfp-ess.el ends here

