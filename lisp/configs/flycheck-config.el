(use-package flycheck
  :ensure t
  :defer nil
  :config
  (global-flycheck-mode 1)
  (setq flycheck-indication-mode 'left-fringe)
  (setq flycheck-display-errors-delay 0.2)
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled newline))
  (setq flycheck-navigation-min-level 2)
  (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (set-face-attribute 'flycheck-error nil :foreground "#fb4934")
  (set-face-attribute 'flycheck-warning nil :foreground "#fabd2f")
  (set-face-attribute 'flycheck-info nil :foreground "#8ec07c"))

(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

(provide 'flycheck-config)
