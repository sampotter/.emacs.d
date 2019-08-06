;;; package --- Summary:

;;; Commentary:

;;; Code:

(defun window-system-is-mac ()
  (or (equal window-system 'mac)
	  (equal window-system 'ns)))

(defun window-system-is-x ()
  (equal window-system 'x))

(defun have-internet-connection-p ()
  "Try to determine if there is an internet connection."
  (let* ((command "ping -c 1 www.google.com")
	 (output (shell-command-to-string command)))
    (not (eql (substring output 0 13) "ping: unknown"))))

(defun recenter-left-right ()
  "Center the window horizontally about the point."
  (interactive)
  (set-window-hscroll (selected-window)
					  (- (current-column)
						 (/ (window-width) 2))))

;; Got this from here:
;;
;; http://stackoverflow.com/questions/21486934/file-specific-key-binding-in-emacs
;;
;; In order to set "file-local keybindings" (kinda)
(defun buffer-local-set-key (key command)
  (let ((old (current-local-map))
        (new (make-sparse-keymap)))
    (when old
      (set-keymap-parent new old))
    (define-key new key command)
    (use-local-map new)))

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))

(provide 'sfp-functions)
;;; sfp-functions.el ends here
