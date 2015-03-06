(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(setq load-path
      (append (list "~/Build/cc-mode-cc-mode")
	      load-path))

(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "k&r"))
      c-basic-offset 4)

(provide 'sfp-cc-mode)
