(install-package-if-necessary 'jabber)

(setq jabber-chat-buffer-show-avatar nil
      jabber-vcard-avatars-publish nil
      jabber-vcard-avaters-retrieve nil
      jabber-roster-show-title nil
      jabber-roster-show-bindings nil
      jabber-roster-line-format " %c %-20n %-s10s %u %S"
      jabber-alert-message-function #'jabber-message-xmessage
      jabber-account-list '(("sam@realizedsound.mooo.com"
			     (:password . "samWord")
			     (:network-server . "realizedsound.mooo.com")
			     (:connection-type . network))))

(provide 'sfp-jabber)
