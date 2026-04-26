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
  (eval-after-load 'doom-themes
    '(progn
       (set-face-foreground 'font-lock-keyword-face "#ea6962")
       (set-face-foreground 'font-lock-builtin-face "#ea6962")
       (set-face-foreground 'font-lock-type-face "#ea6962"))))

(setq package-selected-packages nil)

(provide 'init)