(use-package vertico
  :ensure t
  :init
  (vertico-mode 1)
  (setq vertico-cycle t)
  (setq vertico-resize t))

(use-package marginalia
  :ensure t
  :after vertico
  :init
  (marginalia-mode 1))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic substring))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :ensure t
  :after (vertico marginalia)
  :bind (("C-c h" . consult-history)
         ("C-c m" . consult-man)
         ("C-c k" . consult-keep-lines)
         ("C-c u" . consult-focus-buffer)
         ("M-g M-g" . consult-goto-line)
         ([remap recentf-open-files] . consult-recent-file)
         ([remap switch-to-buffer] . consult-buffer)))

(use-package corfu
  :ensure t
  :hook ((prog-mode text-mode) . corfu-mode)
  :init
  (global-corfu-mode 1)
  (setq corfu-auto t)
  (setq corfu-auto-prefix 1)
  (setq corfu-separator ?\s)
  (setq corfu-quit-no-match t)
  (setq corfu-preview-current nil)
  (setq corfu-scroll-margin 3)
  :bind (:map corfu-map
              ("M-m" . corfu-move-to-nil)
              ("C-j" . corfu-next)
              ("C-k" . corfu-previous)
              ("C-l" . corfu-complete))
  :config
  (set-face-attribute 'corfu-current nil :background "#282828" :foreground "#fabd2f")
  (set-face-attribute 'corfu-bar nil :background "#fabd2f")
  (set-face-attribute 'corfu-border nil :background "#1d2021" :foreground "#a89984")
  (set-face-attribute 'corfu-annotation nil :foreground "#a89984"))

(use-package cape
  :ensure t
  :after corfu
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(provide 'completion-config)