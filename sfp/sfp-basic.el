;;; package --- Summary:

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable all disabled commands.

(setq disabled-command-function nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some miscellaneous settings.

(setq enable-recursive-minibuffers t
      line-number-mode t
      column-number-mode t
	  next-line-add-newlines t
      browse-url-browser-function
	  (cond ((system-type-is-darwin) 'browse-url-default-macosx-browser)
			(t #'browse-url-firefox)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight matching parens, brackets, etc.
(show-paren-mode 1)

;; Make the default cursor an underscore.
(set-default 'cursor-type '(bar . 2))

;; Globally highlight the current line (the line the point is contained in).
(global-hl-line-mode nil)
(setq global-hl-line-sticky-flag t)

;; A mode to help prevent going past 80 characters in a line.
;; See https://github.com/jordonbiondo/column-enforce-mode/ for more info.
(add-to-list 'load-path (concat *sfp-emacs-dir* "el/column-enforce-mode"))
(require 'column-enforce-mode)
(add-hook 'prog-mode-hook 'column-enforce-mode)
(setq column-enforce-comments nil)

;; Highlight TODO, FIXME, and BUG in programming modes.
(add-hook 'prog-mode-hook
	  (lambda ()
	    (font-lock-add-keywords
	     nil
	     '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use window-number mode for jumping to windows with alt-num.

(require 'window-number)
(window-number-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Have backups and auto-saves be stored in the tmp dir.

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copy environment variables from Bash.

(when (system-type-is-darwin)
  (install-package-if-necessary 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GTAGSCONF")
  (exec-path-from-shell-copy-env "GTAGSLABEL"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Changing tab settings...

(set-default 'tab-width 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use ibuffer instead of list-buffers.

(global-set-key (kbd "C-x C-b") 'ibuffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn off all alarm bells.

(setq ring-bell-function 'ignore)

(provide 'sfp-basic)
;;; sfp-basic.el ends here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Delete trailing whitespace when saving files.

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; which-key

(install-package-if-necessary 'which-key)

(which-key-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Colorize Emacs's compilation buffer
;;
;; (from: https://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html)

(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)
