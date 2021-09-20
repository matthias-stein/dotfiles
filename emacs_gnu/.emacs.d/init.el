(package-initialize)
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
    (lsp-ui-doc company-box company pyvenv python-mode dap-mode lsp-ivy lsp-treemacs lsp-ui lsp-pyright lsp-mode json-mode ox-json org-roam-ui simple-httpd websocket org org-roam web-mode projectile neotree org-tempo haskell-mode lilypond org-plus-contrib which-key visual-fill-column use-package rainbow-delimiters org-tree-slide org-superstar org-ml org-make-toc ivy-rich htmlize helpful general evil-multiedit doom-themes doom-modeline dashboard counsel column-enforce-mode)))
 '(safe-local-variable-values
   (quote
    ((eval setq org-roam-capture-templates
	   (quote
	    (("h" "hook" plain "%?" :target
	      (file+head "hook/${slug}.org" "#+TITLE: [Hook] ${title}

")
	      :unnarrowed t)
	     ("k" "konz" plain "%?" :target
	      (file+head "konz/${slug}.org" "#+TITLE: [Konz] ${title}

")
	      :unnarrowed t)
	     ("n" "NPCs" plain "%?" :target
	      (file+head "npcs/${slug}.org" "#+TITLE: [NPCs] ${title}

")
	      :unnarrowed t)
	     ("o" "Orte" plain "%?" :target
	      (file+head "orte/${slug}.org" "#+TITLE: [Orte] ${title}

")
	      :unnarrowed t)
	     ("p" "part" plain "%?" :target
	      (file+head "part/${slug}.org" "#+TITLE: [Part ] ${title}

")
	      :unnarrowed t))))
     (eval setq-local org-roam-db-location
	   (expand-file-name "~/data/docs/GAMES - Role Play/____kamp/Shadowrun Dani/org-roam.db"))
     (eval setq-local org-roam-directory
	   (expand-file-name "~/data/docs/GAMES - Role Play/____kamp/Shadowrun Dani"))
     (eval setq-local org-roam-db-location
	   (expand-file-name "~/data/docs/GAMES\\ -\\ Role Play/____kamp/Shadowrun\\ Dani\\ subfolders/org-roam.db"))
     (eval setq-local org-roam-directory
	   (expand-file-name "~/data/docs/GAMES\\ -\\ Role Play/____kamp/Shadowrun\\ Dani\\ subfolders"))
     (org-roam-capture-templates
      (quote
       (("p" "part" plain "%?" :target
	 (file+head "part____${slug}.org" "#+TITLE: [Part ] ${title}

")
	 :unnarrowed t)
	("n" "NPC" plain "%?" :target
	 (file+head "npcs____${slug}.org" "#+TITLE: [NPCs] ${title}

")
	 :unnarrowed t)
	("h" "hook" plain "%?" :target
	 (file+head "hook____${slug}.org" "#+TITLE: [Hook] ${title}

")
	 :unnarrowed t)
	("k" "konz" plain "%?" :target
	 (file+head "konz____${slug}.org" "#+TITLE: [Konz] ${title}

")
	 :unnarrowed t))))
     (org-roam-db-location . "/home/matthias/test/org-roam.db")
     (org-roam-directory . "/home/matthias/test")
     (org-roam-directory . "/home/matthias/test/org-roam.db")
     (org-roam-directory concat
			 (file-name-as-directory
			  (locate-dominating-file default-directory ".dir-locals.el"))
			 "org-roam.deb")
     (org-roam-directory concat
			 (locate-dominating-file default-directory ".dir-locals.el")
			 "org-roam.deb")
     (org-roam-directory locate-dominating-file default-directory ".dir-locals.el")
     (eval setq-local org-roam-db-location "/home/matthias/data/docs/GAMES - Role Play/____kamp/Shadowrun Dani subfolders")
     (eval setq-local org-roam-directory "/home/matthias/data/docs/GAMES - Role Play/____kamp/Shadowrun Dani subfolders")
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "part" plain "%?" :target
	      (file+head "part____${slug}.org" "#+TITLE: [Part ] ${title}

")
	      :unnarrowed t)
	     ("n" "NPC" plain "%?" :target
	      (file+head "npcs____${slug}.org" "#+TITLE: [NPCs] ${title}

")
	      :unnarrowed t)
	     ("h" "hook" plain "%?" :target
	      (file+head "hook____${slug}.org" "#+TITLE: [Hook] ${title}

")
	      :unnarrowed t)
	     ("k" "konz" plain "%?" :target
	      (file+head "konz____${slug}.org" "#+TITLE: [Konz] ${title}

")
	      :unnarrowed t))))
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "part" plain "%?" :target
	      (file+head "part/${slug}.org" "#+TITLE: [Part ] ${title}

")
	      :unnarrowed t)
	     ("n" "NPC" plain "%?" :target
	      (file+head "npcs/${slug}.org" "#+TITLE: [NPCs] ${title}

")
	      :unnarrowed t)
	     ("h" "hook" plain "%?" :target
	      (file+head "hook/${slug}.org" "#+TITLE: [Hook] ${title}

")
	      :unnarrowed t)
	     ("k" "konz" plain "%?" :target
	      (file+head "konz/${slug}.org" "#+TITLE: [Konz] ${title}

")
	      :unnarrowed t))))
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "part" plain "%?" :target
	      (file+head "part_${slug}.org" "#+TITLE: [Part ] ${title}

")
	      :unnarrowed t)
	     ("n" "NPC" plain "%?" :target
	      (file+head "npcs_${slug}.org" "#+TITLE: [NPCs] ${title}

")
	      :unnarrowed t)
	     ("h" "hook" plain "%?" :target
	      (file+head "hook_${slug}.org" "#+TITLE: [Hook] ${title}

")
	      :unnarrowed t)
	     ("k" "konz" plain "%?" :target
	      (file+head "konz_${slug}.org" "#+TITLE: [Konz] ${title}

")
	      :unnarrowed t))))
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "part" plain "%?" :target
	      (file+head "${slug}" "#+TITLE: [Part ] ${title}

")
	      :unnarrowed t)
	     ("n" "NPC" plain "%?" :target
	      (file+head "${slug}" "#+TITLE: [NPCs] ${title}

")
	      :unnarrowed t)
	     ("h" "hook" plain "%?" :target
	      (file+head "${slug}" "#+TITLE: [Hook] ${title}

")
	      :unnarrowed t)
	     ("k" "konz" plain "%?" :target
	      (file+head "${slug}" "#+TITLE: [Konz] ${title}

")
	      :unnarrowed t))))
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "part" plain
	      (function org-roam-capture--get-point)
	      "%?" :target
	      (file+head "${slug}" "#+TITLE: [Part ] ${title}

")
	      :unnarrowed t)
	     ("n" "NPC" plain
	      (function org-roam-capture--get-point)
	      "%?" :target
	      (file+head "${slug}" "#+TITLE: [NPCs] ${title}

")
	      :unnarrowed t)
	     ("h" "hook" plain
	      (function org-roam-capture--get-point)
	      "%?" :target
	      (file+head "${slug}" "#+TITLE: [Hook] ${title}

")
	      :unnarrowed t)
	     ("k" "konz" plain
	      (function org-roam-capture--get-point)
	      "%?" :target
	      (file+head "${slug}" "#+TITLE: [Konz] ${title}

")
	      :unnarrowed t))))
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "part" plain
	      (function org-roam-capture--get-point)
	      "%?" :file-name "${slug}" :head "#+TITLE: [Part ] ${title}

" :unnarrowed t)
	     ("n" "NPC" plain
	      (function org-roam-capture--get-point)
	      "%?" :file-name "${slug}" :head "#+TITLE: [NPCs] ${title}

" :unnarrowed t)
	     ("h" "hook" plain
	      (function org-roam-capture--get-point)
	      "%?" :file-name "${slug}" :head "#+TITLE: [Hook] ${title}

" :unnarrowed t)
	     ("k" "konz" plain
	      (function org-roam-capture--get-point)
	      "%?" :file-name "${slug}" :head "#+TITLE: [Konz] ${title}

" :unnarrowed t))))
     (eval setq-local org-roam-db-location
	   (expand-file-name "./_roam/org-roam.db"))
     (eval setq-local org-roam-db-location
	   (expand-file-name "./org-roam.db"))
     (eval setq-local org-roam-directory
	   (expand-file-name "./"))
     (org-roam-db-location expand-file-name "./org-roam.db")
     (org-roam-directory expand-file-name ".")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
