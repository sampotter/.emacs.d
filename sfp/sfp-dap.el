;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'dap-mode)

(dap-mode 1)

(require 'dap-gdb-lldb)

; (require 'dap-lldb)
; (setq dap-lldb-debug-program "/opt/local/bin/lldb-vscode-mp-11")

(provide 'sfp-dap)
;;; sfp-dap.el ends here
