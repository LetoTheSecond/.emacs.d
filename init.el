;;;;;;;;;; This fixed garbage collection, makes emacs start up faster ;;;;;;;;;;

(setq gc-cons-threshold 402653184
	gc-cons-percentage 0.6)
(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
	(setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
	(setq gc-cons-threshold 16777216
		gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives'(
		("ELPA"  . "http://tromey.com/elpa/")
		("gnu"   . "http://elpa.gnu.org/packages/")
		("melpa" . "https://melpa.org/packages/")
		("org"   . "https://orgmode.org/elpa/")
	)
)
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(when (file-readable-p "~/.emacs.d/config.org")
	(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
	)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#373b41" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#c5c8c6"))
 '(beacon-color "#cc6666")
 '(custom-enabled-themes (quote (hemisu-dark)))
 '(custom-safe-themes
   (quote
	("7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "d1cc05d755d5a21a31bced25bed40f85d8677e69c73ca365628ce8024827c9e3" default)))
 '(fci-rule-color "#BBBBBB")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(package-selected-packages
   (quote
	(htmlize htmlize-buffer emacs-htmlize linum-relative key-chord magit color-theme-sanityinc-tomorrow hemisu-theme cyberpunk-theme spacemacs-theme moe-theme powerline popup-kill-ring switch-window async fill-column-indicator avy beacon dashboard page-break-lines projectile org-bullets evil-org evil ido-grid-mode ido-describe-bindings smex which-key use-package)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#cc6666")
	 (40 . "#de935f")
	 (60 . "#f0c674")
	 (80 . "#b5bd68")
	 (100 . "#8abeb7")
	 (120 . "#81a2be")
	 (140 . "#b294bb")
	 (160 . "#cc6666")
	 (180 . "#de935f")
	 (200 . "#f0c674")
	 (220 . "#b5bd68")
	 (240 . "#8abeb7")
	 (260 . "#81a2be")
	 (280 . "#b294bb")
	 (300 . "#cc6666")
	 (320 . "#de935f")
	 (340 . "#f0c674")
	 (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(default ((t (:foundry "outline" :family "Courier New")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
