;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'let-alist)
(install-package-if-necessary 'flycheck)
(install-package-if-necessary 'flycheck-irony)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setf flycheck-clang-language-standard "c++11"
	  flycheck-clang-args
	  (pcase (get-hostname)
		("MOLLY" '("-IC:\\Program Files\\boost\\boost_1_58_0"))))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(provide 'sfp-flycheck)
;;; sfp-flycheck.el ends here
