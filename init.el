;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'cl-lib)
(require 'package)

(setq-default global-font-lock-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Don't show the startup screen.

(setq inhibit-startup-screen t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; These functions need to be defined first so that we can figure out platform
;; specific paths.

(defun system-type-is-gnu ()
  "Check whether the system type equals 'gnu."
  (equal system-type 'gnu))

(defun system-type-is-gnu-linux ()
  "Check whether the system type equals 'gnu/linux."
  (equal system-type 'gnu/linux))

(defun system-type-is-gnu-kfreebsd ()
  "Check whether the system type equals 'gnu/kfreebsd."
  (equal system-type 'gnu/kfreebsd))

(defun system-type-is-darwin ()
  "Check whether the system type equals 'darwin."
  (equal system-type 'darwin))

(defun system-type-is-ms-dos ()
  "Check whether the system type equals 'ms-dos."
  (equal system-type 'ms-dos))

(defun system-type-is-windows-nt ()
  "Check whether the system type equals 'windows-nt."
  (equal system-type 'windows-nt))

(defun system-type-is-cygwin ()
  "Check whether the system type equals 'cygwin."
  (equal system-type 'cygwin))

(defun trim-string (string)
  "Remove leading and trailing whitespace from STRING."
  (replace-regexp-in-string "\\`[ \t\n]*" ""
							(replace-regexp-in-string "[ \t\n]*\\'" "" string)))

(defun get-hostname ()
  "Retrieve the hostname as a string."
  (cond ((or (system-type-is-gnu-linux)
			 (system-type-is-darwin))
		 (trim-string (shell-command-to-string "hostname")))
		((system-type-is-windows-nt) (getenv "COMPUTERNAME"))
		(t (error "GET-HOSTNAME unimplemented for current platform"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use mdfind (spotlight) for locate on macOS.

(when (system-type-is-darwin)
  (setq locate-command "mdfind"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fixing up the load-path if we're using Homebrew's OS X Emacs.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This configuration has an emacs directory which is stored in different places
;; on different platforms (depending on where the Dropbox folder is on those
;; computers). Right now this is handled by pcase'ing over the system-type,
;; but this should probably be done instead by pcase'ing over the "hostname" (in
;; Linux terms).

(require 'json)

(defun get-darwin-dropbox-path ()
  (if (system-type-is-darwin)
      (let* ((json-object-type 'hash-table)
	     (json-array-type 'list)
	     (json-key-type 'string)
	     (json (json-read-file "~/.dropbox/info.json")))
	(gethash "path" (gethash "personal" json)))
    nil))

(defconst *sfp-dropbox-dir* (get-darwin-dropbox-path))

(defconst *sfp-emacs-dir* "~/.emacs.d/")

(add-to-list 'load-path (concat *sfp-emacs-dir* "el"))
(add-to-list 'load-path (concat *sfp-emacs-dir* "sfp"))
(add-to-list 'load-path (concat *sfp-emacs-dir* "bibref"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Starting the Emacs server conditionally:

(when (system-type-is-darwin) (server-start))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize-related configuration follows.

(setf custom-file (concat *sfp-emacs-dir* "custom-file.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; TODO: add testing -- would be good to have an elisp function which verifies
;; that all of the packages which are provided are required here.

(require 'sfp-functions)
(require 'sfp-homebrew)
(require 'sfp-interactive)
(require 'sfp-keybindings)
(require 'sfp-packages)
(require 'sfp-basic)
(require 'sfp-window)
(require 'sfp-term)
(require 'sfp-session)
(require 'sfp-man)
(require 'sfp-text-editing)
(require 'sfp-transpose)
(require 'sfp-autocomplete)
; (require 'sfp-rtags)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Languages, modes, and other things.

(require 'sfp-cc-mode)
(require 'sfp-cmake)
; (require 'sfp-conda)
(require 'sfp-cuda)
(require 'sfp-d)
(require 'sfp-dired)
(require 'sfp-ebib)
(require 'sfp-eglot)
; (require 'sfp-ein)
(require 'sfp-elisp)
(require 'sfp-eshell)
(require 'sfp-flycheck)
(require 'sfp-gdb)
(require 'sfp-ggtags)
(require 'sfp-glsl)
(require 'sfp-gnuplot)
(require 'sfp-ido)
(require 'sfp-info)
; (require 'sfp-irony)
(require 'sfp-ispc)
(require 'sfp-latex)
(require 'sfp-lisp)
(require 'sfp-lsp)
(require 'sfp-magit)
(require 'sfp-markdown)
(require 'sfp-matlab)
(require 'sfp-org-mode)
(require 'sfp-pdf)
; (require 'sfp-poly)
(require 'sfp-projectile)
(require 'sfp-python)
(require 'sfp-realgud)
(require 'sfp-sage)
(require 'sfp-smart-mode-line)
(require 'sfp-speedbar)
(require 'sfp-sublimity)
(require 'sfp-skeletons)
(require 'sfp-tramp)
(require 'sfp-yaml)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Restore the previous desktop

(desktop-read)

(provide 'sfp-init)
;;; init.el ends here
