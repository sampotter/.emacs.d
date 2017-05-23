;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'mu4e-alert)

(defun init-mu4e ()
  "Initialize mu4e."
  
  (require 'smtpmail)
  
  (setq message-send-mail-function 'smtpmail-send-it
		mu4e-maildir "~/Mail"
		mu4e-sent-folder "/Sent"
		mu4e-drafts-folder "/Drafts"
		mu4e-trash-folder "/Trash"
		mu4e-refile-folder "/Archives"
		mu4e-use-fancy-chars t
		mu4e-view-prefer-html nil
		mu4e-view-show-images t
		mu4e-get-mail-command "offlineimap"
		mu4e-update-interval 300
		smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
		smtpmail-debug-info t)
  
  ;; Set mu4e default style depending on platform.
  (if (or (system-type-is-darwin)
		  (system-type-is-gnu))
	  (let ((style (cond
					((system-type-is-darwin) 'notifier)
					((system-type-is-gnu) 'libnotify))))
		(mu4e-alert-set-default-style style)
		(add-hook 'after-init-hook #'mu4e-alert-enable-notifications))
	(warn "System type not handled when setting mu4e-alert style"))

  ;; Add unread messages to modeline using mu4e-alert.
  (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display))

(cond
 ((system-type-is-darwin)
  (let ((mu4e-path "/usr/local/share/emacs/site-lisp/mu4e"))
	(if (file-exists-p mu4e-path)
		(progn
		  ;; mu4e
		  (add-to-list 'load-path mu4e-path)
		  (require 'mu4e)
		  (when (featurep 'mu4e)
			(init-mu4e))
		  ;; mu4e-maildirs-extension
		  (install-package-if-necessary 'mu4e-maildirs-extension)
		  (when (package-installed-p 'mu4e-maildirs-extension)
			(require 'mu4e-maildirs-extension)
			(mu4e-maildirs-extension)))
	  (message "No Homebrew-installed mu4e on this system"))))
 ((system-type-is-gnu-linux)
  (let ((mu4e-load-path "/usr/share/emacs/site-lisp/mu4e"))
	(unless (member mu4e-load-path load-path)
	  (add-to-list 'load-path mu4e-load-path)))
  (require 'mu4e)
  (init-mu4e))
 (t (message "mu4e unsupported on this platform")))

(setq mu4e-contexts
	  (list (make-mu4e-context
			 :name "UMIACS"
			 :enter-func (lambda () (mu4e-message "Entering UMIACS context"))
			 :leave-func (lambda () (mu4e-message "Leaving UMIACS context"))
			 :match-func (lambda (msg)
						   (when msg
							 (mu4e-message-contact-field-matches
							  msg :to "sfp@umiacs.umd.edu")))
			 :vars '((user-mail-address . "sfp@umiacs.umd.edu")
					 (user-full-name . "Samuel F. Potter")
					 (mu4e-drafts-folder . "/UMIACS/INBOX.Drafts")
					 (mu4e-sent-folder . "/UMIACS/INBOX.Sent")
					 (mu4e-trash-folder . "/UMIACS/INBOX.Trash")
					 (mu4e-refile-folder . "/UMIACS/INBOX.Archives")
					 (smtpmail-mail-address . "sfp@umiacs.umd.edu")
					 (smtpmail-smtp-server . "smtp.umiacs.umd.edu")
					 (smtpmail-smtp-service . 587)))
			(make-mu4e-context
			 :name "Hushmail"
			 :enter-func (lambda () (mu4e-message "Entering Hushmail context"))
			 :leave-func (lambda () (mu4e-message "Leaving Hushmail context"))
			 :match-func (lambda (msg)
						   (when msg
							 (mu4e-message-contact-field-matches
							  msg :to "sfp@hush.ai")))
			 :vars '((user-mail-address . "sfp@hush.ai")
					 (user-full-name . "Sam Potter")
					 (mu4e-drafts-folder . "/Hushmail/Drafts")
					 (mu4e-sent-folder . "/Hushmail/Sent")
					 (mu4e-trash-folder . "/Hushmail/Trash")
					 (mu4e-refile-folder . "/Hushmail/Archives")
					 (smtpmail-mail-address . "sfp@hush.ai")
					 (smtpmail-smtp-server . "smtp.hushmail.com")
					 (smtpmail-smtp-service . 587)))))

(setq mu4e-context-policy 'pick-first)
(setq mu4e-compose-context-policy nil)

(provide 'sfp-mu4e)
;;; sfp-mu4e.el ends here
