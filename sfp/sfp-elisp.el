;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'paredit)

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'ggtags-mode)

(provide 'sfp-elisp)
;;; sfp-elisp.el ends here
