(display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(set-face-attribute 'line-number nil :background "#1d2021" :foreground "#a89984")
(set-face-attribute 'line-number-current-line nil :background "#1d2021" :foreground "#ebdbb2")
(set-face-attribute 'mode-line nil :background "#1d2021" :foreground "#ebdbb2" :height 0.9)
(set-face-attribute 'mode-line-inactive nil :background "#282828" :foreground "#a89984" :height 0.9)

(dolist (mode '(org-mode-hook term-mode-hook shell-mode-hook eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

(provide 'linum-config)