(add-to-list 'load-path "~/.emacs.d/sfp")
; (add-to-list 'load-path "~/.emacs.d/sfp/themes")

(require 'sfp-functions)
(require 'sfp-keybindings)
(require 'sfp-packages)
(require 'sfp-basic)
(require 'sfp-window)
(require 'sfp-term)
(require 'sfp-session)
(require 'sfp-cedet)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Languages, modes, and other things.

(require 'sfp-cc-mode)
(require 'sfp-chess)
(require 'sfp-cmake)
(require 'sfp-company)
(require 'sfp-d)
(require 'sfp-ess)
(require 'sfp-gnus)
(require 'sfp-haskell)
(require 'sfp-jabber)
(require 'sfp-latex)
(require 'sfp-lisp)
(require 'sfp-magit)
(require 'sfp-matlab)
(require 'sfp-ocaml)
(require 'sfp-org-mode)
(require 'sfp-p4)
(require 'sfp-python)
(require 'sfp-skeletons)
(require 'sfp-supercollider)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Themes.

; (require 'sfp-colorless-white-theme)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zenburn-theme zen-and-art-theme wanderlust w3 ujelly-theme twilight-theme tuareg tronesque-theme tron-theme toxi-theme tommyh-theme tango-2-theme steady-theme soothe-theme solarized-theme sea-before-storm-theme qsimpleq-theme purple-haze-theme pastels-on-dark-theme paredit nzenburn-theme monokai-theme magit jujube-theme jabber ir-black-theme heroku-theme haskell-mode github-theme ggtags gandalf-theme function-args flatland-theme ess django-theme deep-thought-theme d-mode company color-theme-solarized clues-theme chess bubbleberry-theme auctex assemblage-theme ample-zen-theme ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
