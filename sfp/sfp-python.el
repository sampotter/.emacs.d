;;; package --- Summary:

;;; Commentary:

;;; Code:

(install-package-if-necessary 'elpy)

(elpy-enable)

(setq auto-mode-alist
	  (append '(("\\.pmd$" . poly-pweave-mode)
				("\\.pymd$" . poly-pweave-mode)
				("SConstruct$" . python-mode)
				("SConscript$" . python-mode))
			  auto-mode-alist))

(setq elpy-shell-echo-output nil
	  python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)

(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

(setq elpy-rpc-virtualenv-path 'current)

(install-package-if-necessary 'pipenv)

(install-package-if-necessary 'cython-mode)
(install-package-if-necessary 'flycheck-cython)

(provide 'sfp-python)
;;; sfp-python.el ends here
