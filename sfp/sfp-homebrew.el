;;; package --- Summary:
;;; Commentary:
;;; Code:

(defun sfp-homebrew/get-formula-version (formula)
  (let* ((command (concat "brew info " formula))
		 (output (shell-command-to-string command))
		 (lines (split-string output "\n"))
		 (first-line (car lines)))
	(elt (split-string first-line " ") 2)))

(provide 'sfp-homebrew)
;;; sfp-homebrew.el ends here
