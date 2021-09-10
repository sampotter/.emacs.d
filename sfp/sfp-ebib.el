;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'ebib)

; This doesn't work exactly right, but whatever...
(setq ebib-default-directory *sfp-dropbox-dir*
	  ebib-preload-bib-files '("/Users/sfp/Dropbox/sfp.bib")
	  ebib-file-search-dirs (list "~" "/Users/sfp/Dropbox"))

(provide 'sfp-ebib)
;;; sfp-ebib.el ends here
