;; remove the startup message
(setq inhibit-startup-message t)

;; remove clustered UI (only in graphical mode)
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'tooltip-mode) (tooltip-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(when (fboundp 'set-fringe-mode) (set-fringe-mode 10))