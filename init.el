;; Emacs Configuration - Modular setup like nvim

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "elpa" user-emacs-directory))

;; Core configs
(require 'configs/package-config)
(require 'configs/options-config)
(require 'configs/ui-config)
(require 'configs/completion-config)
(require 'configs/company-config)
(require 'configs/treesitter-config)
(require 'configs/lsp-config)
(require 'configs/flycheck-config)

;; UI configs
(require 'ui/linum-config)
(require 'ui/modeline-config)

;; Feature configs
(require 'configs/projectile-config)
(require 'configs/ide-config)
(require 'configs/magit-config)
(require 'configs/harpoon-config)
(require 'keymaps/keymaps)

;; Theme - no bold, no italic
(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold nil)
  (setq doom-themes-enable-italic nil)
  :config
  (load-theme 'doom-gruvbox t)
  (set-face-foreground 'font-lock-keyword-face "#ea6962")
  (set-face-foreground 'font-lock-builtin-face "#ea6962")
  (set-face-foreground 'font-lock-type-face "#ea6962"))

;; Transparent frame
(setq default-frame-alist '((alpha . 90) (background-color . "unspecified")))
(set-face-attribute 'default nil :background 'unspecified)
(set-face-attribute 'fringe nil :background 'unspecified)
(set-face-attribute 'line-number nil :background 'unspecified)
(set-face-attribute 'line-number-current-line nil :background 'unspecified)
(set-face-attribute 'vertical-border nil :background 'unspecified)

;; Make faces transparent after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (run-with-timer 1 nil
                          (lambda ()
                            (set-face-attribute 'company-tooltip nil :background 'unspecified)
                            (set-face-attribute 'company-tooltip-selection nil :background 'unspecified)
                            (set-face-attribute 'line-number nil :background 'unspecified)
                            (set-face-attribute 'line-number-current-line nil :background 'unspecified)))))

(setq package-selected-packages nil)

(provide 'init)