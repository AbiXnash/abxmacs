(use-package magit
  :ensure t
  :bind ("C-c g" . magit-file-dispatch)
  :init
  (setq magit-display-buffer-function #'magit-display-buffer-split)
  (setq magit-diff-refine-hunk t)
  (setq magit-section-show-child-count t))

(use-package diff-hl
  :ensure t
  :hook ((magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :init
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1)
  (setq diff-hl-update-async t)
  (setq diff-hl-flydiff-delay 0.5)
  (setq diff-hl-global-modes '(not image-mode pdf-view-mode))
  (setq diff-hl-draw-borders nil))

(use-package magit-todos
  :ensure t
  :after magit
  :init
  (magit-todos-mode 1)
  (setq magit-todos-keywords '("TODO" "FIXME" "BUG" "HACK" "NOTE")))

(use-package forge
  :ensure t
  :after magit)

(provide 'configs/magit-config)