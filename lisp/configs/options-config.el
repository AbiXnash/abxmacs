(defun my/add-path-entry (path)
  "Add PATH to both `exec-path' and the PATH environment variable."
  (let ((expanded (expand-file-name path)))
    (when (file-directory-p expanded)
      (add-to-list 'exec-path expanded)
      (setenv "PATH" (concat expanded path-separator (getenv "PATH"))))))

(dolist (path '("/opt/homebrew/bin" "~/.cargo/bin" "~/.local/bin" "~/go/bin"))
  (my/add-path-entry path))

(setenv "ZIG_LOG_LEVEL" "warn")
(setenv "ZLS_ENABLE_INLAY_HINTS" "true")

(setq inhibit-startup-message t)
(setq visible-bell t)
(setq ring-bell-function 'ignore)

(setq-default fill-column 100)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)

(setq-default cursor-in-non-mode-lines nil)
(setq cursor-type 'bar)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq-default transient-mark-mode t)
(setq-default make-pointer-invisible t)

(setq search-ring-max 1000)
(setq regexp-search-ring-max 1000)

(setq history-length 1000)
(setq-default savehist-additional-variables '(search-ring regexp-search-ring))

(setq recenter-positions '(middle top bottom))
(setq scroll-margin 20)
(setq scroll-conservatively 101)
(setq scroll-preserve-screen-position t)

(setq kill-ring-max 1000)

(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq display-buffer-base-action '(display-buffer-reuse-window))

(setq frame-resize-pixelwise t)
(setq window-resize-pixelwise t)

(setq find-file-visit-truename t)
(setq vc-follow-symlinks t)

(setq-default display-line-numbers-widen t)

(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . go-mode))
(add-to-list 'auto-mode-alist '("\\.gotmpl\\'" . go-mode))

(provide 'configs/options-config)
