;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'transpose-frame)

(global-set-key (kbd "C-c C-f C-t") 'transpose-frame)
(global-set-key (kbd "C-c C-f C-r") 'rotate-frame)
(global-set-key (kbd "C-c C-f C-i") 'flip-frame)
(global-set-key (kbd "C-c C-f C-o") 'flop-frame)
(global-set-key (kbd "C-c C-f C-a") 'rotate-frame-clockwise)
(global-set-key (kbd "C-c C-f C-c") 'rotate-frame-anticlockwise)

(provide 'sfp-transpose)
;;; sfp-transpose.el ends here
