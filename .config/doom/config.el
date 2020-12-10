(setq user-full-name "Matthias Stein")

(setq user-mail-address "matthias.stein3@gmail.com")

(setq display-line-numbers-type 'relative)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; (setq fancy-splash-image "~/.config/doom/imgs_emacs_logo_text.svg")
;; (setq fancy-splash-image "~/.config/doom/imgs_emacs_logo_2017.svg")

;; Solarized Dark
;; (setq fancy-splash-image "~/.config/doom/imgs/self_doom_emacs_0001.svg")
;; Dracula
(setq fancy-splash-image "~/.config/doom/imgs/self_doom_emacs_0002.svg")

;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-solarized-dark)
(setq doom-theme 'doom-dracula)
