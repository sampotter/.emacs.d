;;; package --- Summary:

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some miscellaneous settings.

(setq enable-recursive-minibuffers t
      line-number-mode t
      column-number-mode t
      browse-url-browser-function #'browse-url-firefox)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight matching parens, brackets, etc.
(show-paren-mode 1)

;; Make the default cursor an underscore.
(set-default 'cursor-type 'hbar)

;; Globally highlight the current line (the line the point is contained in).
; (global-hl-line-mode nil)
; (set-face-background 'hl-line "#efefef")

;; A mode to help prevent going past 80 characters in a line.
;; See https://github.com/jordonbiondo/column-enforce-mode/ for more info.
(add-to-list 'load-path "~/.emacs.d/el/column-enforce-mode")
(require 'column-enforce-mode)
(add-hook 'prog-mode-hook 'column-enforce-mode)

;; Highlight TODO, FIXME, and BUG in programming modes.
(add-hook 'prog-mode-hook
	  (lambda ()
	    (font-lock-add-keywords
	     nil
	     '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use window-number mode for jumping to windows with alt-num.

(add-to-list 'load-path "~/.emacs.d/el")

(require 'window-number)
(window-number-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Have backups and auto-saves be stored in the tmp dir.

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ...?

(when (or (system-type-is-darwin)
	  (system-type-is-windows-nt))
  (install-package-if-necessary 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Changing tab settings...

(set-default 'tab-width 4)

(provide 'sfp-basic)
;;; sfp-basic.el ends here
