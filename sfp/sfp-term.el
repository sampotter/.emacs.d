(setf term-mode-hook
      (lambda ()
	(interactive)
	(term-line-mode)
	(term-pager-enable)))

(provide 'sfp-term)
