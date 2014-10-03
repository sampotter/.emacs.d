(setq user-full-name "Sam Potter"
      user-mail-address "sfp@hush.ai"
      
      gnus-select-method
      '(nnimap "hushmail"
	       (nnimap-address "imap.hushmail.com")
	       (nnimap-stream starttls))
      
      gnus-secondary-select-methods 
      '((nnimap "uw"
		(nnimap-address "imap.gmail.com")
		(nnimap-server-port 993)
		(nnimap-stream ssl))
	;; (nnimap "hushmail"
	;; 	(nnimap-address "imap.hushmail.com")
	;; 	(nnimap-stream starttls))
	(nntp "news.gmane.org")))

(provide 'sfp-gnus)
