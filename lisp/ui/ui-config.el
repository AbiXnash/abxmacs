(setq inhibit-startup-message t)
(setq transient-mark-mode t)

(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'tooltip-mode) (tooltip-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(add-to-list 'default-frame-alist '(alpha . 85))
(when (fboundp 'set-fringe-mode) (set-fringe-mode 10))
(column-number-mode)
(global-hl-line-mode 1)
(show-paren-mode 1)

(provide 'ui/ui-config)
