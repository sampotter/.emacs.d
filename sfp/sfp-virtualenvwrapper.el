;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'virtualenvwrapper)

(venv-initialize-interactive-shells)
(venv-initialize-eshell)

(setq venv-location
	  '("/Volumes/Molly/Dropbox/Research/nufft/nufft-venv"))

(provide 'sfp-virtualenvwrapper)
;;; sfp-virtualenvwrapper.el ends here
