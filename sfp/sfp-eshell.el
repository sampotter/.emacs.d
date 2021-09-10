;;; package --- Summary:
;;; Commentary:
;;; Code:

(add-hook 'eshell-preoutput-filter-functions 'ansi-color-apply)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use the Eshell smart display.

(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

(provide 'sfp-eshell)
;;; sfp-eshell.el ends here
