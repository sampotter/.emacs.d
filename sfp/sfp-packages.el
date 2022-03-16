;;; package --- Summary:

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Convenience functions.

(defun install-package-if-necessary (package)
  (unless (package-installed-p package)
    (package-install package)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Include other package archives.

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(if (have-internet-connection-p)
    (package-initialize)
    (package-refresh-contents))

(provide 'sfp-packages)
;;; sfp-packages.el ends here
