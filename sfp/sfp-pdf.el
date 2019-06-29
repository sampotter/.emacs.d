;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'pdf-tools)

(require 'pdf-tools)

(sfp-homebrew/get-formula-version "poppler")

(let ((libffi-version (sfp-homebrew/get-formula-version "libffi"))
	  (poppler-version (sfp-homebrew/get-formula-version "poppler"))
	  (zlib-version (sfp-homebrew/get-formula-version "zlib")))
  (setenv "PKG_CONFIG_PATH"
		  (concat "/usr/local/Cellar/libffi/" libffi-version "/lib/pkgconfig" ":"
				  "/usr/local/Cellar/poppler/" poppler-version "/lib/pkgconfig" ":"
				  "/usr/local/Cellar/zlib/" zlib-version "/lib/pkgconfig" ":"
				  "/usr/local/lib/pkgconfig" ":"
				  "/opt/X11/lib/pkgconfig" ":")
		  (getenv "PKG_CONFIG_PATH")))

(pdf-tools-install)

(provide 'sfp-pdf)
;;; sfp-pdf.el ends here
