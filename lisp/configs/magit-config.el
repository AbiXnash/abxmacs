(require 'git-gutter)
(when (fboundp 'global-git-gutter-mode)
  (global-git-gutter-mode 1))

(when (fboundp 'fringe-mode)
  (fringe-mode 8))

(use-package git-gutter-fringe
  :ensure t
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-file-dispatch))

(use-package forge
  :ensure t
  :after magit)

(provide 'configs/magit-config)