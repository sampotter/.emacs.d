;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'projectile)

(projectile-mode +1)

;; Recommended keymap prefix on macOS
; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(defun m/projectile-project-find-function (dir)
  (let ((root (projectile-project-root dir)))
    (and root (cons 'my/projectile root))))

(cl-defmethod project-root ((pr (head my/projectile)))
  (cdr pr))

(cl-defmethod project-files ((pr (head my/projectile)) &optional _dirs)
  (let ((root (cdr pr)))
    (mapcar
     (lambda (file)
       (concat root file))
     (projectile-project-files root))))

(cl-defmethod project-ignores ((pr (head my/projectile)) _dir)
  (let ((default-directory (cdr pr)))
    (projectile-patterns-to-ignore)))

(with-eval-after-load 'project
  (add-to-list 'project-find-functions 'm/projectile-project-find-function))

(projectile-register-project-type 'meson '("meson.build")
								  :project-file "meson.build"
								  :compilation-dir "builddir"
								  :configure "meson setup builddir"
								  :compile "meson compile"
								  :test "meson test")

(provide 'sfp-projectile)
;;; sfp-projectile.el ends here
