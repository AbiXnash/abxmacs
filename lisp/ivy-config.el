(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode 1)
  (savehist-mode 1))

(use-package counsel
  :ensure t
  :after ivy
  :config
  (counsel-mode 1))

(use-package ivy-rich
  :ensure t
  :after ivy
  :config
  (ivy-rich-mode 1))

(provide 'ivy-config)
