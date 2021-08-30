(org-babel-load-file
 (expand-file-name
  "lisp-code/ms-lisp-utils.org"
  user-emacs-directory))

(org-babel-load-file
 (expand-file-name
  "conf.org"
  user-emacs-directory))

(org-babel-load-file
 (expand-file-name
  "conf_home.org"
  user-emacs-directory))

;; (org-babel-load-file
;;  (expand-file-name
;;   "init_work.org"
;;   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode projectile neotree org-tempo haskell-mode lilypond org-plus-contrib which-key visual-fill-column use-package rainbow-delimiters org-tree-slide org-superstar org-ml org-make-toc ivy-rich htmlize helpful general evil-multiedit doom-themes doom-modeline dashboard counsel column-enforce-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
