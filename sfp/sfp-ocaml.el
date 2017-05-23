;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'tuareg)
(install-package-if-necessary 'utop)
(install-package-if-necessary 'merlin)

(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist)) 
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)

(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(setq opam-share
	  (substring (shell-command-to-string "opam config var share") 0 -1))

(setq tuareg-indent-align-with-first-arg nil)

(provide 'sfp-ocaml)
;;; sfp-ocaml.el ends here
