(defun system-type-is-gnu () (equal system-type 'gnu))
(defun system-type-is-gnu-linux () (equal system-type 'gnu/linux))
(defun system-type-is-gnu-kfreebsd () (equal system-type 'gnu/kfreebsd))
(defun system-type-is-darwin () (equal system-type 'darwin))
(defun system-type-is-ms-dos () (equal system-type 'ms-dos))
(defun system-type-is-windows-nt () (equal system-type 'windows-nt))
(defun system-type-is-cygwin () (equal system-type 'cygwin))

(defun have-internet-connection-p ()
  (let* ((command "ping -c 1 www.google.com")
	 (output (shell-command-to-string command)))
    (eql (substring output 0 13) "ping: unknown")))

(defun recenter-left-right ()
  "Center the window horizontally about the point."
  (interactive)
  (set-window-hscroll (selected-window)
		      (- (current-column)
			 (/ (window-width) 2))))

(provide 'sfp-functions)
