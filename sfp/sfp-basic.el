;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Get rid of extra GUI widgets.

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight matching parens, brackets, etc.
(show-paren-mode 1)

;; Make the default cursor an underscore.
(set-default 'cursor-type 'hbar)

;; Globally highlight the current line (the line the point is contained in).
(global-hl-line-mode t)
(set-face-background 'hl-line "#efefef")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use window-number mode for jumping to windows with alt-num.

(add-to-list 'load-path "~/.emacs.d/el")

(require 'window-number)
(window-number-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Have backups and auto-saves be stored in the tmp dir.

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(provide 'sfp-basic)
