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
 '(ansi-color-names-vector
   ["#2E3440" "#BF616A" "#A3BE8C" "#EBCB8B" "#81A1C1" "#B48EAD" "#88C0D0" "#ECEFF4"])
 '(custom-safe-themes
   (quote
    ("0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" default)))
 '(exwm-floating-border-color "#1c2028")
 '(fci-rule-color "#4C566A")
 '(highlight-tail-colors ((("#394147") . 0) (("#37424e") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#191C25" "#81A1C1"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#191C25" "#A3BE8C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#191C25" "#434C5E"))
 '(objed-cursor-color "#BF616A")
 '(package-selected-packages
   (quote
    (scss-mode jinja2-mode command-log-mode lsp-ui-doc company-box company pyvenv python-mode dap-mode lsp-ivy lsp-treemacs lsp-ui lsp-pyright lsp-mode json-mode ox-json org-roam-ui simple-httpd websocket org org-roam web-mode projectile neotree org-tempo haskell-mode lilypond org-plus-contrib which-key visual-fill-column use-package rainbow-delimiters org-tree-slide org-superstar org-ml org-make-toc ivy-rich htmlize helpful general evil-multiedit doom-themes doom-modeline dashboard counsel column-enforce-mode)))
 '(pdf-view-midnight-colors (cons "#ECEFF4" "#2E3440"))
 '(rustic-ansi-faces
   ["#2E3440" "#BF616A" "#A3BE8C" "#EBCB8B" "#81A1C1" "#B48EAD" "#88C0D0" "#ECEFF4"])
 '(safe-local-variable-values
   (quote
    ((eval setq org-current-tag-alist
	   (quote
	    (("holidays")
	     ("family"))))
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "prsn" plain "%?" :target
	      (file+head "roam/prsn/${slug}.org" "* [Person] ${title}

")
	      :unnarrowed t)
	     ("l" "lctn" plain "%?" :target
	      (file+head "roam/lctn/${slug}.org" "* [Location] ${title}

")
	      :unnarrowed t))))
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "prsn" plain "%?" :target
	      (file+head "roam/prsn/{slug}.org" "#+TITLE: [Person] ${title}

")
	      :unnarrowed t)
	     ("l" "lctn" plain "%?" :target
	      (file+head "roam/lctn/${slug}.org" "#+TITLE: [Location] ${title}

")
	      :unnarrowed t))))
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "prsn" plain "%?" :target
	      (file+head "roam/prsn{slug}.org" "#+TITLE: [Person] ${title}

")
	      :unnarrowed t)
	     ("l" "lctn" plain "%?" :target
	      (file+head "roam/lctn/${slug}.org" "#+TITLE: [Location] ${title}

")
	      :unnarrowed t))))
     (eval setq org-roam-capture-templates
	   (quote
	    (("p" "prsn" plain "%?" :target
	      (file+head "roam/prsn{slug}.org" "#+TITLE: [Person] ${title}

")
	      :unnarrowed t)
	     ("o" "Orte" plain "%?" :target
	      (file+head "orte/${slug}.org" "#+TITLE: [Orte] ${title}

")
	      :unnarrowed t)
	     ("l" "lctn" plain "%?" :target
	      (file+head "roam/lctn/${slug}.org" "#+TITLE: [Location] ${title}

")
	      :unnarrowed t))))
     (eval setq-local org-roam-db-location
	   (expand-file-name "~/data/pics/roam/org-roam.db"))
     (eval setq-local org-roam-directory
	   (expand-file-name "~/data/pics"))
     (eval add-hook
	   (quote after-save-hook)
	   (lambda nil
	     (org-babel-tangle))
	   nil t)
     (eval setq org-roam-capture-templates
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
     (org-roam-directory expand-file-name "."))))
 '(vc-annotate-background "#2E3440")
 '(vc-annotate-color-map
   (list
    (cons 20 "#A3BE8C")
    (cons 40 "#bbc28b")
    (cons 60 "#d3c68b")
    (cons 80 "#EBCB8B")
    (cons 100 "#e2b482")
    (cons 120 "#d99d79")
    (cons 140 "#D08770")
    (cons 160 "#c68984")
    (cons 180 "#bd8b98")
    (cons 200 "#B48EAD")
    (cons 220 "#b77f96")
    (cons 240 "#bb7080")
    (cons 260 "#BF616A")
    (cons 280 "#a05b67")
    (cons 300 "#815664")
    (cons 320 "#625161")
    (cons 340 "#4C566A")
    (cons 360 "#4C566A")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
