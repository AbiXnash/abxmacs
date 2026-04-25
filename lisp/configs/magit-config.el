(use-package magit
  :ensure t
  :bind ("C-c g" . magit-file-dispatch)
  :init
  (setq magit-display-buffer-function #'magit-display-buffer-split)
  (setq magit-diff-refine-hunk t)
  (setq magit-diff-paint-whitespace t)
  (setq magit-section-show-child-count t))

(use-package diff-hl
  :ensure t
  :hook ((magit-pre-refresh . diff-hl-magit-pre-refresh)
        (magit-post-refresh . diff-hl-magit-post-refresh))
  :init
  (global-diff-hl-mode 1)
  (setq diff-hl-show-hunk-markers t)
  (setq diff-hl-fringe-bmp 'delta))

(use-package magit-todos
  :ensure t
  :after magit
  :init
  (magit-todos-mode 1)
  (setq magit-todos-keywords '("TODO" "FIXME" "BUG" "HACK" "NOTE")))

(use-package forge
  :ensure t
  :after magit)

(provide 'magit-config)