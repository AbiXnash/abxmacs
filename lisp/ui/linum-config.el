(display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(set-face-attribute 'line-number nil :foreground "#a89984")
(set-face-attribute 'line-number-current-line nil :foreground "#ebdbb2" :weight 'bold)

(dolist (mode '(org-mode-hook term-mode-hook shell-mode-hook eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

(provide 'ui/linum-config)