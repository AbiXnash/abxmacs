(use-package helpful
  :ensure t
  :defer nil
  :bind (([remap describe-function] . helpful-callable)
         ([remap describe-command] . helpful-command)
         ([remap describe-variable] . helpful-variable)
         ([remap describe-key] . helpful-key)))

(use-package avy
  :ensure t
  :defer nil
  :bind (("M-j" . avy-goto-char-timer)
         ("M-g l" . avy-goto-line)
         ("M-g w" . avy-goto-word-1))
  :config
  (setq avy-background t)
  (setq avy-timeout-seconds 0.3))

(use-package ace-window
  :ensure t
  :defer nil
  :bind (("M-o" . ace-window))
  :config
  (setq aw-scope 'frame)
  (setq aw-background nil)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package diff-hl
  :ensure t
  :defer nil
  :hook ((after-init . global-diff-hl-mode)
         (dired-mode . diff-hl-dired-mode)
         (magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (set-face-attribute 'diff-hl-insert nil :foreground "#b8bb26" :background 'unspecified)
  (set-face-attribute 'diff-hl-change nil :foreground "#fabd2f" :background 'unspecified)
  (set-face-attribute 'diff-hl-delete nil :foreground "#fb4934" :background 'unspecified))

(use-package vundo
  :ensure t
  :bind (("C-x u" . vundo)))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind (:map dired-mode-map
              ("TAB" . dired-subtree-toggle)
              ("<backtab>" . dired-subtree-cycle))
  :config
  (setq dired-subtree-use-backgrounds nil))

(provide 'configs/qol-config)
