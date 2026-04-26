(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 4)
  (setq doom-modeline-icon nil)
  (setq doom-modeline-major-mode-icon nil)
  (setq doom-modeline-lsp-icon nil)
  (setq doom-modeline-time-icon nil)
  (setq doom-modeline-time nil)
  (setq doom-modeline-battery nil)
  (setq doom-modeline-vcs-icon nil)
  (setq doom-modeline-github nil)
  (setq doom-modeline-mu4e nil)
  (setq doom-modeline-gnus nil)
  (setq doom-modeline-irc nil)
  (setq doom-modeline-remote-host nil)
  (setq doom-modeline-modal nil)
  (setq doom-modeline-persp-name nil)
  (setq doom-modeline-workspace-name nil)
  (setq doom-modeline-lsp nil)
  (setq doom-modeline-check nil)
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-indent-info nil)
  (setq doom-modeline-buffer-encoding nil)
  (setq doom-modeline-env-version nil)
  :config
  (doom-modeline-mode 1)
  (set-face-attribute 'doom-modeline nil :background "#1d2021" :foreground "#ebdbb2" :height 0.9)
  (set-face-attribute 'doom-modeline-bar nil :background "#fabd2f")
  (set-face-attribute 'doom-modeline-highlight nil :foreground "#fabd2f")
  (set-face-attribute 'doom-modeline-urgent nil :foreground "#fb4934" :background "#1d2021")
  (set-face-attribute 'doom-modeline-warning nil :foreground "#fabd2f" :background "#1d2021"))

(use-package anzu
  :ensure t
  :init
  (global-anzu-mode 1)
  (setq anzu-cons-mode-line-p nil)
  (set-face-attribute 'anzu-mode-line nil :foreground "#fabd2f" :background "#282828"))

(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode text-mode) . rainbow-delimiters-mode)
  :init
  (setq rainbow-delimiters-max-face-count 8))

(use-package highlight-parentheses
  :ensure t
  :hook ((prog-mode text-mode) . highlight-parentheses-mode)
  :init
  (setq highlight-parentheses-colors '("#fb4934" "#fabd2f" "#8ec07c" "#83a598")))

(use-package display-line-numbers
  :init
  (setq display-line-numbers-width-start t)
  (set-face-attribute 'line-number nil :foreground "#a89984" :background "#1d2021")
  (set-face-attribute 'line-number-current-line nil :foreground "#ebdbb2" :background "#282828" :weight 'bold))

(use-package visual-regexp
  :ensure t
  :bind ("C-c r" . vr/query-replace))

(use-package volatile-highlights
  :ensure t
  :init
  (volatile-highlights-mode 1))

(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-ring-bell-on-mismatch t)

(provide 'ui/modeline-config)