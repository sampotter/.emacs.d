;;; package --- Summary:

;;; Commentary:

;;; Code:

;; (require 'python)

;; (install-package-if-necessary 'pythonic)

;; ; TODO: comment this out until we get it working...
;; ;; (install-package-if-necessary 'conda)
;; ;; (conda-env-initialize-interactive-shells)
;; ;; (conda-env-initialize-eshell)
;; ;; (conda-env-autoactivate-mode t)
;; ;; (custom-set-variables '(conda-anaconda-home "~/miniconda3"))

;; (install-package-if-necessary 'cython-mode)

;; (when (system-type-is-darwin)
;;   (setenv "ETS_TOOLKIT" "qt4")
;;   (setenv "QT_API" "pyqt5"))

;; (let ((interpreter-args
;;        (concat (cond ((system-type-is-darwin)
;; 					  "-i --gui=qt5")
;; 					 ((or (system-type-is-gnu)
;; 						  (system-type-is-gnu-linux)
;; 						  (system-type-is-gnu-kfreebsd))
;; 					  "--gui=gtk --matplotlib=gtk --colors=NoColors")
;; 					 (t ""))
;; 			   " --simple-prompt"))
;;       (completion-setup-code
;;        "from IPython.core.completerlib import module_completion")
;;       (completion-module-string-code "';'.join(module_completion('''%s'''))\n")
;;       (completion-string-code
;;        "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))
;;   (setq python-shell-interpreter "ipython3"
;; 		python-shell-interpreter-args interpreter-args
;; 		python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;; 		python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;; 		python-shell-completion-setup-code completion-setup-code
;; 		python-shell-completion-string-code completion-module-string-code
;; 		python-shell-completion-string-code completion-string-code))

;; (setq python-indent-guess-indent-offset t)
;; (setq python-indent-guess-indent-offset-verbose nil)

(install-package-if-necessary 'elpy)

(elpy-enable)

(provide 'sfp-python)
;;; sfp-python.el ends here
