;;; package --- Summary

;;; Commentary:

;;; Code:

(add-to-list 'load-path (concat *sfp-emacs-dir* "el/p4.el"))
(require 'p4)

(when (system-type-is-darwin)
  (setq p4-executable "/usr/local/bin/p4"))

(setq p4-my-clients
	  (pcase (get-hostname)
		("armitage.local" '("spotter_armitage_vgmmobile"
							"spotter_armitage_4918"))))

(p4-set-client-name (car p4-my-clients))

(provide 'sfp-p4)
;;; sfp-p4.el ends here
