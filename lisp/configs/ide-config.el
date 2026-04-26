(use-package treemacs
  :ensure t
  :bind (("C-c t" . treemacs)
         ("C-c T" . treemacs-select-window))
  :init
  (setq treemacs-width 30)
  (setq treemacs-indentation 2)
  (setq treemacs-show-hidden-files nil)
  (setq treemacs-silent-refresh t)
  (setq treemacs-collapse-dirs 3))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

(use-package ace-window
  :ensure t
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-dispatch-alist
        '((?x aw-delete-window "Delete Window")
          (?m aw-swap-window "Swap Window")
          (?c aw-split-window-vert "Split Vert")
          (?v aw-split-window-horz "Split Horz")
          (?b aw-switch-buffer-in-window "Switch Buffer")))
  :bind ("M-o" . ace-window))

(use-package avy
  :ensure t
  :bind (("C-'" . avy-goto-char)
         ("M-g g" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/mark-all-dwim)
         ("C->" . mc/mark-next-like-this-word)
         ("C-<" . mc/mark-previous-like-this-word)
         ("C-S-l" . mc/edit-lines)))

(use-package undo-fu
  :ensure t)

(use-package undo-fu-session
  :ensure t
  :init
  (undo-fu-session-mode 1))

(use-package comment-dwim-2
  :ensure t
  :bind ("M-;" . comment-dwim-2))

(use-package easy-kill
  :ensure t)

(use-package nvm
  :ensure t)

(provide 'configs/ide-config)