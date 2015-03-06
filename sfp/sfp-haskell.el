;;; package --- Summary:

;;; Commentary:

;;; Code:

(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)))

(provide 'sfp-haskell)
;;; sfp-haskell.el ends here
