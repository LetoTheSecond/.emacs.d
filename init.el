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
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(beacon-color "#f2777a")
 '(custom-enabled-themes (quote (hemisu-dark)))
 '(custom-safe-themes
   (quote
	("7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "d1cc05d755d5a21a31bced25bed40f85d8677e69c73ca365628ce8024827c9e3" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(package-selected-packages
   (quote
	(color-theme-sanityinc-tomorrow hemisu-theme cyberpunk-theme which-key use-package switch-window spacemacs-theme smex projectile powerline popup-kill-ring moe-theme ido-grid-mode ido-describe-bindings evil-org dashboard beacon avy async)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#f2777a")
	 (40 . "#f99157")
	 (60 . "#ffcc66")
	 (80 . "#99cc99")
	 (100 . "#66cccc")
	 (120 . "#6699cc")
	 (140 . "#cc99cc")
	 (160 . "#f2777a")
	 (180 . "#f99157")
	 (200 . "#ffcc66")
	 (220 . "#99cc99")
	 (240 . "#66cccc")
	 (260 . "#6699cc")
	 (280 . "#cc99cc")
	 (300 . "#f2777a")
	 (320 . "#f99157")
	 (340 . "#ffcc66")
	 (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default")))))
