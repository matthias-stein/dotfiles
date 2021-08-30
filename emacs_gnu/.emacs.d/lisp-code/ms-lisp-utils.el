(defun ms/dash-logo()
  "return dashboard logo corresponding to color scheme"
  (format "~/.emacs.d/dashboard_logo_%s.png"
          (cond ((string-equal (car custom-enabled-themes) "doom-one") 
                               "doom-one")
                ((string-equal (car custom-enabled-themes) "doom-dracula") "dracula")
                ((string-equal (car custom-enabled-themes) "doom-nord") 
                               "nord")
                ((string-equal (car custom-enabled-themes) "doom-solarized-dark")   
                               "solarized-dark")
                ((string-equal (car custom-enabled-themes) "doom-solarized-light")   
                               "solarized-light")
                ("doom-one"))))

(defun ms/cycle-themes ()
  "cycle through a defined set of themes, update dahboard.el's logo"
  (interactive)
  ;; get active theme
  (let ((active (car custom-enabled-themes)))
       ;; unload all loaded themes
       (while custom-enabled-themes
         (disable-theme (car custom-enabled-themes)))
       ;; switch to next theme
       (cond ((string-equal active "doom-dracula")
              (load-theme 'doom-nord t)
              (message "Change from %s to doom-nord." active))
             ((string-equal active "doom-nord")
              (load-theme 'doom-one t)
              (message "Change from %s to doom-one." active))
             ((string-equal active "doom-one")
              (load-theme 'doom-solarized-dark t)
              (message "Change from %s to doom-solarized-dark." active))
             ((string-equal active "doom-solarized-dark")
              (load-theme 'doom-solarized-light t)
              (message "Change from %s to doom-solarized-light." active))
             ((string-equal active "doom-solarized-light")
              (load-theme 'doom-dracula t)
              (message "Change from %s to doom-dracula." active))
             (t (load-theme 'doom-one t)))
       ;; update file reference to logo file
       (setq dashboard-startup-banner (ms/dash-logo))
       ;; refresh dashbord. Code taken from dashboard.el/dahsboard-refresh-bugger()
       (let ((dashboard-force-refresh t)) (dashboard-insert-startupify-lists))
))

(defun ms/switch-theme()
  "switch to different theme and update dashboard.el's logo accordingly"
  (interactive)
  ;; get active theme
  ;; (let ((active (car custom-enabled-themes)))
  (let ((new-theme (completing-read "Choose new theme: "
                                    '(("doom-dracula" "doom-dracula")
		    		   ("doom-nord" "doom-nord")
		    		   ("doom-one" "doom-one")
		    		   ("doom-solarized-dark" "doom-solarized-dark")
		    		   ("doom-solarized-light" "doom-solarized-light"))
                                    nil t "doom-"))
        (old-theme (car custom-enabled-themes)))
       ;; unload all loaded themes
       (while custom-enabled-themes
         (disable-theme (car custom-enabled-themes)))
       ;; switch to chosen theme
       (cond ((string-equal new-theme "doom-dracula")
              (load-theme 'doom-dracula t))
             ((string-equal new-theme "doom-nord")
              (load-theme 'doom-nord t))
             ((string-equal new-theme "doom-one")
              (load-theme 'doom-one t))
             ((string-equal new-theme "doom-solarized-dark")
              (load-theme 'doom-solarized-dark t))
             ((string-equal -new-theme "doom-solarized-light")
              (load-theme 'doom-solarized-light t)))
       (message "Change from %s to %s." old-theme new-theme)
       ;; update file reference to logo file
       (setq dashboard-startup-banner (ms/dash-logo))
       ;; refresh dashbord. Code taken from dashboard.el/dahsboard-refresh-bugger()
       (let ((dashboard-force-refresh t)) (dashboard-insert-startupify-lists))
))

(defun ms/org-todo-buffer ()
 "Create new indirect buffer with sparse tree of undone TODO items"
 (interactive)
 (clone-indirect-buffer "*org TODO undone*" t)
 (org-show-todo-tree nil) ; mimics interactive usage
 (org-remove-occur-highlights))

(provide 'ms-lisp-utils)
