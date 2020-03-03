;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'rtags)

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
(add-hook 'objc-mode-hook 'rtags-start-process-unless-running)

(provide 'sfp-rtags)
;;; sfp-rtags.el ends here
