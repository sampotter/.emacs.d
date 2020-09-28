;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'elpy)

(elpy-enable)

(add-to-list 'auto-mode-alist '("\\.pmd" . poly-pweave-mode))
(add-to-list 'auto-mode-alist '("\\.pymd" . poly-pweave-mode))

(setq elpy-shell-echo-output nil
	  python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)

(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

(provide 'sfp-python)
;;; sfp-python.el ends here
