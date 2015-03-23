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
(require 'sfp-scheme)
(require 'sfp-skeletons)
(require 'sfp-supercollider)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(sublime-theme helm-theme alect-theme zonokai-theme zenburn-theme zen-and-art-theme yoshi-theme xresources-theme warm-night-theme waher-theme underwater-theme ujelly-theme ubuntu-theme twilight-theme tuareg tronesque-theme tron-theme toxi-theme tommyh-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme subatomic256-theme subatomic-theme stekene-theme steady-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme smyx-theme slime-theme slime seti-theme sea-before-storm-theme reverse-theme remember-theme railscasts-theme qsimpleq-theme purple-haze-theme professional-theme planet-theme peacock-theme pastels-on-dark-theme paredit org-beautify-theme oldlace-theme occidental-theme obsidian-theme nzenburn-theme noctilux-theme niflheim-theme naquadah-theme mustard-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme mellow-theme mbo70s-theme magit lush-theme light-soap-theme leuven-theme lavender-theme late-night-theme jujube-theme jazz-theme jabber ir-black-theme inkpot-theme hipster-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme grandshell-theme gotham-theme github-theme ggtags gandalf-theme flycheck flatui-theme flatland-theme firecode-theme firebelly-theme exec-path-from-shell ess espresso-theme eclipse-theme django-theme display-theme deep-thought-theme darkmine-theme darkburn-theme dark-krystal-theme darcula-theme dakrone-theme d-mode cyberpunk-theme company column-enforce-mode colonoscopy-theme cmake-mode clues-theme chess busybee-theme bubbleberry-theme boron-theme bliss-theme basic-theme base16-theme badger-theme auctex atom-dark-theme assemblage-theme anti-zenburn-theme ample-zen-theme ample-theme ahungry-theme afternoon-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
