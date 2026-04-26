;; General keybindings
(global-set-key (kbd "C-x C-f") 'find-file)

;; Window navigation (like vim easy-motion)
(windmove-default-keybindings 'super)

;; Project
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
(global-set-key (kbd "C-c p f") 'projectile-find-file)
(global-set-key (kbd "C-c p g") 'projectile-grep)
(global-set-key (kbd "C-c p b") 'projectile-switch-to-buffer)

;; Magit
(global-set-key (kbd "C-c g") 'magit-file-dispatch)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

;; Treemacs
(global-set-key (kbd "C-c t") 'treemacs)
(global-set-key (kbd "C-c T") 'treemacs-select-window)

;; Avy - fast jumping
(global-set-key (kbd "M-g g") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "C-'") 'avy-goto-char)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this-word)

;; Flycheck
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

;; LSP
(global-set-key (kbd "C-c l l") 'lsp)
(global-set-key (kbd "C-c l r") 'lsp-rename)
(global-set-key (kbd "C-c l a") 'lsp-execute-code-action)
(global-set-key (kbd "C-c l h") 'lsp-hover)
(global-set-key (kbd "C-c l d") 'lsp-find-definition)
(global-set-key (kbd "C-c l D") 'lsp-find-declaration)
(global-set-key (kbd "C-c l i") 'lsp-find-implementation)
(global-set-key (kbd "C-c l f") 'lsp-format-buffer)

;; Indent/format
(global-set-key (kbd "M-i") 'tab-to-tab-stop)

(provide 'keymaps/keymaps)