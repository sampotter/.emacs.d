(add-to-list 'load-path "~/.emacs.d/el/p4.el")
(require 'p4)

(when (system-type-is-darwin)
  (setq p4-executable "/usr/bin/p4")
  (setq p4-my-clients '("spotter_mac_renderdev"
                        "spotter_mac_mainline"
                        "spotter_mac_imgproc")))

(provide 'sfp-p4)
