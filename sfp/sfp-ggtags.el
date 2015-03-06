(install-package-if-necessary 'ggtags)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
	      (ggtags-mode 1))))

(setenv "GTAGSFORCECPP" "1")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reset these two keybindings to the Emacs defaults, since I use them
;; frequently.

(global-set-key (kbd "M-<") 'beginning-of-buffer)
(global-set-key (kbd "M->") 'end-of-buffer)

(provide 'sfp-ggtags)
