(use-package yasnippet
  :ensure t
  :defer nil
  :config
  (yas-global-mode 1))

(use-package company
  :ensure t
  :defer nil
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
              ("M-/" . company-complete)
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
              ("C-d" . company-show-doc-buffer))
  :config
  (global-company-mode 1)
  (setq company-idle-delay 0.0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-tooltip-align-annotations t)
  (setq company-require-match nil)
  (setq company-backends '(company-capf company-files company-dabbrev-code company-keywords))
  (setq company-frontends
        '(company-pseudo-tooltip-unless-just-one-frontend
          company-preview-if-just-one-frontend
          company-echo-metadata-frontend))
  (setq company-transformers '(company-sort-by-occurrence
                               company-sort-prefer-same-case-prefix))
  (setq company-global-modes '(not eshell-mode shell-mode term-mode vterm-mode))
  (set-face-attribute 'company-tooltip nil
                      :background 'unspecified
                      :foreground "#ebdbb2")
  (set-face-attribute 'company-tooltip-common nil
                      :background 'unspecified
                      :foreground "#fabd2f")
  (set-face-attribute 'company-tooltip-selection nil
                      :background 'unspecified
                      :foreground "#fabd2f")
  (set-face-attribute 'company-tooltip-annotation nil
                      :background 'unspecified)
  (set-face-attribute 'company-tooltip-annotation-selection nil
                      :background 'unspecified)
  (set-face-attribute 'company-preview-common nil
                      :background 'unspecified
                      :foreground "#ebdbb2")
  (set-face-attribute 'company-preview nil
                      :background 'unspecified)
  (set-face-attribute 'company-scrollbar-fg nil
                      :background "#fabd2f")
  (set-face-attribute 'company-scrollbar-bg nil
                      :background 'unspecified))

(provide 'company-config)
