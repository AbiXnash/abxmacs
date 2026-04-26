(use-package company
  :ensure t
  :hook ((prog-mode text-mode) . company-mode)
  :init
  (global-company-mode 1)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 8)
  (setq company-require-match nil)
  (setq company-global-modes '(not eshell-mode shell-mode term-mode vterm-mode))
  :config
  (setq company-backends '(company-capf company-dabbrev-code company-keywords)))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(provide 'configs/company-config)