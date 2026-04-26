(use-package magit
  :ensure t
  :bind ("C-c g" . magit-file-dispatch)
  :init
  (setq magit-display-buffer-function #'magit-display-buffer-split)
  (setq magit-diff-refine-hunk t)
  (setq magit-section-show-child-count t))

(use-package git-gutter
  :ensure t
  :hook (prog-mode . git-gutter-mode)
  :init
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :ensure t
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(use-package diff-hl
  :ensure t
  :after (git-gutter git-gutter-fringe)
  :hook ((magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :init
  (global-diff-hl-mode 1))

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