(use-package vertico
  :ensure t
  :init
  (vertico-mode 1)
  (setq vertico-cycle t))

(use-package marginalia
  :ensure t
  :after vertico
  :init
  (marginalia-mode 1))

(use-package consult
  :ensure t
  :after vertico)

(provide 'configs/completion-config)