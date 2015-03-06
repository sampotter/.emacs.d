;;; package --- Summary:

;;; Commentary:

;;; Code:

(setf term-mode-hook
      (lambda ()
	(interactive)
	(term-line-mode)
	(term-pager-enable)))

(provide 'sfp-term)
;;; sfp-term.el ends here
