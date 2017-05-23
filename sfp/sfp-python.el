;;; package --- Summary:

;;; Commentary:

;;; Code:

(require 'python)

(let ((interpreter-args
       (concat (cond ((system-type-is-darwin)
					  "-i")
					 ((or (system-type-is-gnu)
						  (system-type-is-gnu-linux)
						  (system-type-is-gnu-kfreebsd))
					  "--gui=gtk --matplotlib=gtk --colors=NoColors")
					 (t ""))
			   " --simple-prompt"))
      (completion-setup-code
       "from IPython.core.completerlib import module_completion")
      (completion-module-string-code "';'.join(module_completion('''%s'''))\n")
      (completion-string-code
       "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))
  (setq python-shell-interpreter "ipython"
		python-shell-interpreter-args interpreter-args
		python-shell-prompt-regexp "In \\[[0-9]+\\]: "
		python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
		python-shell-completion-setup-code completion-setup-code
		python-shell-completion-string-code completion-module-string-code
		python-shell-completion-string-code completion-string-code))

(provide 'sfp-python)
;;; sfp-python.el ends here
