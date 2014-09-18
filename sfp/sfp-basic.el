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

; TODO: For some reason this doesn't work... why?

;; (dotimes (nth 1 10)
;;   (global-set-key
;;    (kbd (concat "M-" (int-to-string nth)))
;;    '(lambda ()
;;       (interactive)
;;       (window-number-select nth))))

; in the mean time:

(global-set-key (kbd "M-1") (lambda () (interactive) (window-number-select 1)))
(global-set-key (kbd "M-2") (lambda () (interactive) (window-number-select 2)))
(global-set-key (kbd "M-3") (lambda () (interactive) (window-number-select 3)))
(global-set-key (kbd "M-4") (lambda () (interactive) (window-number-select 4)))
(global-set-key (kbd "M-5") (lambda () (interactive) (window-number-select 5)))
(global-set-key (kbd "M-6") (lambda () (interactive) (window-number-select 6)))
(global-set-key (kbd "M-7") (lambda () (interactive) (window-number-select 7)))
(global-set-key (kbd "M-8") (lambda () (interactive) (window-number-select 8)))
(global-set-key (kbd "M-9") (lambda () (interactive) (window-number-select 9)))
(global-set-key (kbd "M-0") (lambda () (interactive) (window-number-select 10)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Have backups and auto-saves be stored in the tmp dir.

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(provide 'sfp-basic)
