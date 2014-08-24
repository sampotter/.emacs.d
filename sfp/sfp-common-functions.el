(defun system-type-is-gnu () (equal system-type 'gnu))
(defun system-type-is-gnu-linux () (equal system-type 'gnu/linux))
(defun system-type-is-gnu-kfreebsd () (equal system-type 'gnu/kfreebsd))
(defun system-type-is-darwin () (equal system-type 'darwin))
(defun system-type-is-ms-dos () (equal system-type 'ms-dos))
(defun system-type-is-windows-nt () (equal system-type 'windows-nt))
(defun system-type-is-cygwin () (equal system-type 'cygwin))

(defun install-package-if-necessary (package)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'sfp-common-functions)
