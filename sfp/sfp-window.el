;;; package --- Summary:

;;; Commentary:

;; Get rid of extra GUI widgets.

;;; Code:

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(defvar theme-packages
  (list
   'afternoon-theme
   'ahungry-theme
   'alect-theme
   'ample-theme
   'anti-zenburn-theme
   'atom-dark-theme
   'badger-theme
   'base16-theme
   'basic-theme
   'bliss-theme
   'boron-theme
   'busybee-theme
   'colonoscopy-theme
   'cyberpunk-theme
   'dakrone-theme
   'darcula-theme
   'dark-krystal-theme
   'darkburn-theme
   'darkmine-theme
   'display-theme
   'eclipse-theme
   'espresso-theme
   'firebelly-theme
   'firecode-theme
   'flatui-theme
   'gotham-theme
   'grandshell-theme
   'gruvbox-theme
   'hc-zenburn-theme
   'helm-theme
   'hemisu-theme
   'hipster-theme
   'inkpot-theme
   'jazz-theme
   'late-night-theme
   'lavender-theme
   'leuven-theme
   'light-soap-theme
   'lush-theme
   'mbo70s-theme
   'mellow-theme
   'minimal-theme
   'moe-theme
   'molokai-theme
   'monochrome-theme
   'mustang-theme
   'mustard-theme
   'naquadah-theme
   'niflheim-theme
   'noctilux-theme
   'obsidian-theme
   'occidental-theme
   'oldlace-theme
   'org-beautify-theme
   'peacock-theme
   'planet-theme
   'professional-theme
   'railscasts-theme
   'remember-theme
   'reverse-theme
   'seti-theme
   'slime-theme
   'smyx-theme
   'soft-morning-theme
   'soft-stone-theme
   'subatomic-theme
   'subatomic256-theme
   'sublime-theme
   'sunny-day-theme
   'tango-plus-theme
   'tangotango-theme
   'ubuntu-theme
   'underwater-theme
   'waher-theme
   'warm-night-theme
   'xresources-theme
   'yoshi-theme
   'zonokai-theme)
  "List of packages for each theme that we would like to have available.")

(dolist (package theme-packages)
  (condition-case nil
      (install-package-if-necessary package)
    (error (concat "Unable to install package " (symbol-name package)))))



; (load-theme 'basic t)
; (load-theme 'stekene-light t)
; (load-theme 'stekene-dark t)
; (load-theme 'whiteboard t)
(load-theme 'underwater-theme t)

(when window-system
  (defvar font-use-system-font t)
  (set-face-attribute 'default nil :height 120))

(mapc (lambda (pair) (add-to-list 'default-frame-alist pair))
      (list '(width . 80)
            '(height . 24)))

(provide 'sfp-window)
;;; sfp-window.el ends here
