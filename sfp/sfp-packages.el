(package-initialize)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-refresh-contents)

(mapcar (lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
	(list 'color-theme-solarized
	      'haskell-mode))

(provide 'sfp-packages)
