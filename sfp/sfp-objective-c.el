;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'objc-font-lock)
(objc-font-lock-global-mode 1)

(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))

(add-to-list 'magic-mode-alist
			 `(,(lambda ()
                     (and (string= (file-name-extension buffer-file-name) "h")
                          (re-search-forward "@\\<interface\\>" 
					     magic-mode-regexp-match-limit t)))
                  . objc-mode))

(provide 'sfp-objective-c)
;;; sfp-objective-c.el ends here
