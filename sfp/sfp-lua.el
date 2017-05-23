;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'lua-mode)

;; Hardly anything is defined, so let's just redefine it...
(setq lua-prefix-mode-map (make-sparse-keymap))

(define-key lua-prefix-mode-map (kbd "C-b") 'lua-send-buffer)
(define-key lua-prefix-mode-map (kbd "C-c") 'lua-send-current-line)
(define-key lua-prefix-mode-map (kbd "C-f") 'lua-search-documentation)
(define-key lua-prefix-mode-map (kbd "C-p") 'lua-send-proc)
(define-key lua-prefix-mode-map (kbd "C-r") 'lua-send-region)

(setq lua-documentation-function 'eww)

(provide 'sfp-lua)
;;; sfp-lua.el ends here
