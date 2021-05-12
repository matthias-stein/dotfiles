(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/manual_els/")

(setq user-full-name "Matthias Stein")
(setq user-mail-address "matthias.stein3@gmail.com")

(scroll-bar-mode -1)         
(tool-bar-mode -1)           
(tooltip-mode -1)            
(menu-bar-mode -1)             
(set-fringe-mode 10)

(setq inhibit-startup-message t)

(setq initial-scratch-message ";; ------------========<<<< Welcome to >>>>========-------------
;;
;;   _____ _   _ _    _     ______ __  __          _____  _____ 
;;  / ____| \\ | | |  | |   |  ____|  \\/  |   /\\   / ____|/ ____|
;; | |  __|  \\| | |  | |   | |__  | \\  / |  /  \\ | |    | (___  
;; | | |_ | . ` | |  | |   |  __| | |\\/| | / /\\ \\| |     \\___ \\ 
;; | |__| | |\\  | |__| |   | |____| |  | |/ ____ \\ |____ ____) |
;;  \\_____|_| \\_|\\____/    |______|_|  |_/_/    \\_\\_____|_____/ 

")

(use-package page-break-lines)
(use-package dashboard
  :init
  (setq dashboard-startup-banner "~/.emacs.d/dashboard_logo_mod.png")
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-navigator t)
  (setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)
  (setq dashboard-set-init-info t)
  :config
  (dashboard-setup-startup-hook))

(column-number-mode)
(global-display-line-numbers-mode 't)
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-width 4)

(dolist (mode '(eshell-mode-hook
                shell-mode-hook
                term-mode-hook ))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq-default cursor-in-non-selected-windows nil)

(setq ring-bell-function 'ignore)

(fset 'yes-or-no-p 'y-or-n-p)

(set-face-attribute 'default nil :font "Ubuntu Mono" :height 125)
(global-visual-line-mode 1)

(use-package doom-themes
  :config (setq doom-themes-enable-bold t
                doom-themes-enable-italic t)
	   (load-theme 'doom-dracula t)
	   (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 20)
	   (doom-modeline-icon (display-graphic-p))
	   (doom-modeline-major-mode-icon t)
	   (doom.modeline-major-mode-color-icon t) 
	   (doom-modeline-buffer-state-icon t)
	   (doom-modeline-buffer-modification-icon t)))

(use-package all-the-icons)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defun ms/kill-other-buffers ()
  "Kill all other buffers.

   https://www.emacswiki.org/emacs/KillingBuffers#h5o-2"
   (interactive)
   (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(use-package general
  :after evil
  :config
  (general-create-definer ms/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (ms/leader-keys
    ;; GENERAL STUFF
    "gl"   'evil-goto-line
    ;; WINDOWS
    ;; delete windows
    "wd"   'delete-window
    "wo"   'delete-other-windows
    ;; move focus to other window
    "wh"   'windmove-left
    "wj"   'windmove-down
    "wk"   'windmove-up
    "wl"   'windmove-right
    ;; create new window
    "wx"   'evil-window-vnew
    "wy"   'evil-window-new
    ;; window placement
    "wJ"   'evil-window-rotate-downwards
    "wK"   'evil-window-rotate-upwards
    ;; window sizes
    "wb"   'balance-windows
    "ws"   'shrink-window-if-larger-than-buffer
    "wn"   'evil-window-increase-width
    "wm"   'evil-window-decrease-width
    "w,"   'evil-window-increase-height
    "w."   'evil-window-decrease-height

    ;; BUFFER
    "bb"   'counsel-ibuffer
    "bl"   'evil-next-buffer
    "bh"   'evil-prev-buffer
    "bd"   'kill-current-buffer  
    "bo"   'ms/kill-other-buffers 

    ;; ORGMODE
    "ocl"  'org-store-link
    "oca"  'org-agenda
    "occ"  'org-capture
    ;; org babel
    "obt"  'org-babel-tangle
    ;; org clock
    "oci"  'org-clock-in
    "oco"  'org-clock-out 
    "occ"  'org-clock-cancel
    "ocd"  'org-clock-display
    "ocr"  'org-clock-report 
    "ocu"  'org-clock-update-time-maybe
    ;; org source blocks
    "osi"  'org-edit-special
    "oso"  'org-edit-source-exit
    "osx"  'org-edit-src-abort
    ;; org tags 'labels'
    "oli"  'org-set-tags-command
    ;; org timestamps
    "oti"  'org-time-stamp
    "otu"  'org-timestamp-up
    "otd"  'org-timestamp-down
    "ote"  'org-evaluate-time-range
    ;; visual fill column mode
    "ovt"  'global-visual-fill-column-mode 

    ;; FILES
    "ff"   'counsel-find-file
    "fi"  '(lambda () (interactive) (find-file (expand-file-name "~/.emacs.d/init.org")))
    ))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config (ivy-mode 1))
;; M-x M-O -> submenue for entry, like open source code

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.5))

(use-package column-enforce-mode
  :hook (prog-mode . column-enforce-mode)
  :custom (setq column-enforce-column 80))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package evil-multiedit)
;; Highlights all matches of the selection in the buffer.
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Insert marker at point
(define-key evil-insert-state-map (kbd "M-d") 'evil-multiedit-toggle-marker-here)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; `evil-multiedit-match-symbol-and-next` (or prev).

;; Restore the last group of multiedit regions.
(define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; RET will toggle the region under the cursor
(define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ...and in visual mode, RET will disable all fields outside the selected region
(define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; For moving between edit regions
(define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
(define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
(evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)

(defun ms/org-font-setup ()
  (dolist (face '((org-level-1 . 1.25)
                  (org-level-2 . 1.20)
                  (org-level-3 . 1.15)
                  (org-level-4 . 1.10)
                  (org-level-5 . 1.05)
                  (org-level-6 . 1.05)
                  (org-level-7 . 1.05)
                  (org-level-8 . 1.05)))
    (set-face-attribute (car face) nil :font "Ubuntu" :weight 'bold :height (cdr face))))

(use-package org
  :config 
  (setq org-todo-keywords
    '((sequence "TODO" "WIP" "DONE")))
  (setq org-ellipsis "⤵")
  (setq org-startup-indented t)
  (setq org-image-actual-width 400)
  (ms/org-font-setup))

(use-package htmlize)

(use-package org-superstar
  :hook
  (org-mode . (lambda () (org-superstar-mode 1)))
  :init (org-superstar-mode 1)
  (setq org-superstar-headline-bullets-list '("›"))
  (setq org-superstar-leading-bullet ?\s))

(defun ms/org-mode-visual-fill ()
  (setq visual-fill-column-width 100)
  (setq visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook 
  (org-mode . ms/org-mode-visual-fill))

(with-eval-after-load 'org
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (python . t)
        (css . t)
        (haskell . t)
        (sass . t)
        (shell . t)
        (sql . t)
        (sqlite . t))))

(use-package org-make-toc)

(use-package org-ml)
(require 'om-to-xml)

;; (defun ms/org-babel-tangle-config ()
;;   (when (string-equal (substring buffer-file-name -8) "init.org")
;;     (let ((org-config-babel-evaluate nil))
;;       (org-babel-tangle)))) 

;;(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook 'ms/org-babel-tangle-config)))

;; (defun ms/org-babel-auto-tangle-on-save ()
;;   ;; Dynamic scoping to the rescue
;;   (let ((org-confirm-babel-evaluate nil))
;;     (org-babel-tangle)))

;; (add-hook 'org-mode-hook (
;;   lambda () (
;;     add-hook 'after-save-hook #'ms/org-babel-auto-tangle-on-save
;;              'run-at-end 'only-in-org-mode)))

(use-package org-tree-slide
  :diminish
  :bind 
  (:map org-mode-map
        ("<f8>" . org-tree-slide-mode)
   :map org-tree-slide-mode-map
        ("<f9>" . org-tree-slide-move-previous-tree)
        ("<f10>" . org-tree-slide-move-next-tree)
        ("<f11>" . org-tree-slide-content))
  :hook 
  ((org-tree-slide-play . (lambda ()
                            (text-scale-increase 3)
                            (org-display-inline-images)
                            (setq org-hide-emphasis-markers t)
                            (setq display-line-numbers nil)))
   (org-tree-slide-stop . (lambda ()
                            (text-scale-increase 0)
                            (org-display-inline-images)
                            (setq org-hide-emphasis-markers nil)
                            (setq display-line-numbers 1)
                            (ms/org-font-setup))))
  :custom
  (org-tree-slide-in-effect t)
  (org-tree-slide-heading-emphasis t)
  (org-tree-slide-header t)
  (org-tree-slide-breadcrumbs " ❱ ")
  (org-tree-slide-activate-message "Show'em!")
  (org-tree-slide-deactivate-message "Well done, mate!")
  (org-image-actual-width nil))

(global-auto-revert-mode 1)

(org-reload)
