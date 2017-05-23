;;; package --- Summary:
;;; Commentary:
;;; Code:

(setf dired-use-ls-dired nil)

(require 'dired-x)

(add-hook 'dired-mode-hook
		  (lambda ()
			(dired-hide-details-mode)
			(dired-omit-mode)))

(setq dired-omit-files
	  (join-with-separator '("^\\.?#" ; autosave files
							 "^\\.DS_Store$" ; OS X .DS_Store files
							 "^\\._") ; OS X ._ files
						   "\\|"))

(install-package-if-necessary 'diredful)
(diredful-mode 1)

(provide 'sfp-dired)
;;; sfp-dired.el ends here
