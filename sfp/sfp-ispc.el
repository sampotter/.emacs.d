;;; package --- Summary:
;;; Commentary:
;;; Code:

(defun add-ispc-keywords()
  "adds uniform and varying keywords for c and c++ modes"
  (font-lock-add-keywords nil
                          '(("<(uniform)" . 'font-lock-keyword-face)
                            ("<(varying)" . 'font-lock-keyword-face))))

(add-hook 'c++-mode-hook 'add-ispc-keywords)
(add-to-list 'auto-mode-alist '(".ispc$" . c++-mode))
(add-to-list 'auto-mode-alist '(".isph$" . c++-mode))

(provide 'sfp-ispc)
;;; sfp-ispc.el ends here
