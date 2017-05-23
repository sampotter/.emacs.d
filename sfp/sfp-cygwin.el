;;; package --- Summary:
;;; Commentary:
;;; Code:

(when (system-type-is-windows-nt)
  (install-package-if-necessary 'cygwin-mount)
  (install-package-if-necessary 'setup-cygwin)
  ;(require 'setup-cygwin) ; this doesn't seem to be working...
  )

(provide 'sfp-cygwin)
;;; sfp-cygwin.el ends here
