;;; package --- Summary:
;;; Commentary:
;;; Code:

(mapcar #'install-package-if-necessary
		'(cargo
		  flycheck-rust
		  flymake-rust
		  rust-mode))

(provide 'sfp-rust)
;;; sfp-rust.el ends here
