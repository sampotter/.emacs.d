;;; package --- Summary:
;;; Commentary:
;;; Code:

(defun reverse-words (beg end)
  "Reverses the words in the region that begins at BEG and ends at END."
  (interactive "*r")
  (apply
   'insert
   (reverse
	(split-string
	 (delete-and-extract-region beg end) "\\b"))))

(provide 'sfp-interactive)
;;; sfp-interactive.el ends here
