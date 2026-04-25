;; Emacs Configuration - Modular setup like nvim

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Core configs (load order matters)
(require 'configs/package-config)
(require 'configs/options-config)
(require 'configs/ui-config)
(require 'configs/completion-config)
(require 'configs/treesitter-config)
(require 'configs/lsp-config)
(require 'configs/company-config)
(require 'configs/flycheck-config)

;; UI configs
(require 'ui/theme-config)
(require 'ui/linum-config)
(require 'ui/modeline-config)

;; Feature configs
(require 'configs/projectile-config)
(require 'configs/magit-config)
(require 'configs/harpoon-config)
(require 'keymaps/keymaps)

(custom-set-variables
 '(package-selected-packages nil))
(custom-set-faces)