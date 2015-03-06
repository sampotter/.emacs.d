(load-file "~/.emacs.d/el/cedet/cedet-devel-load.el")

(add-to-list 'load-path "~/.emacs.d/sfp")

;; TODO: add testing -- would be good to have an elisp function which verifies
;; that all of the packages which are provided are required here.

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
(require 'sfp-flycheck)
(require 'sfp-ggtags)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck zenburn-theme zen-and-art-theme ujelly-theme twilight-theme tuareg tronesque-theme tron-theme toxi-theme tommyh-theme tango-2-theme stekene-theme steady-theme spacegray-theme soothe-theme solarized-theme slime sea-before-storm-theme qsimpleq-theme purple-haze-theme pastels-on-dark-theme paredit nzenburn-theme monokai-theme magit jujube-theme jabber ir-black-theme heroku-theme github-theme ggtags gandalf-theme flatland-theme exec-path-from-shell ess django-theme deep-thought-theme d-mode company column-enforce-mode cmake-mode clues-theme chess bubbleberry-theme basic-theme auctex assemblage-theme ample-zen-theme)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
