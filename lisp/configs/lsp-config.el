(defconst my/lua-love2d-library-path
  "/opt/homebrew/opt/lua-language-server/libexec/meta/3rd/love2d"
  "LuaLS bundled Love2D library path.")

(defun my/lua-project-root ()
  "Return the current Lua project root, if any."
  (or (when-let ((project (project-current nil)))
        (expand-file-name (project-root project)))
      (when buffer-file-name
        (or (locate-dominating-file buffer-file-name "conf.lua")
            (locate-dominating-file buffer-file-name "main.lua")))))

(defun my/lua-project-love2d-p ()
  "Return non-nil when the current Lua project looks like a Love2D project."
  (when-let ((root (my/lua-project-root)))
    (or (file-exists-p (expand-file-name "conf.lua" root))
        (when-let ((main-file (expand-file-name "main.lua" root)))
          (and (file-exists-p main-file)
               (with-temp-buffer
                 (insert-file-contents main-file nil 0 8192)
                 (re-search-forward
                  "\\_<love\\.\\(load\\|update\\|draw\\|run\\|conf\\|keypressed\\|mousepressed\\)\\_>"
                  nil t)))))))

(defun my/lua-mode-setup ()
  "Apply Lua project-specific settings before LSP starts."
  (when (my/lua-project-love2d-p)
    (require 'lsp-lua)
    (setq-local lsp-lua-runtime-version "LuaJIT")
    (setq-local lsp-lua-diagnostics-globals
                (vconcat
                 (delete-dups
                  (append '("love")
                          (append lsp-lua-diagnostics-globals nil)))))
    (when (file-directory-p my/lua-love2d-library-path)
      (let ((libraries (make-hash-table :test 'equal)))
        (cond
         ((hash-table-p lsp-lua-workspace-library)
          (maphash (lambda (key value)
                     (puthash key value libraries))
                   lsp-lua-workspace-library))
         ((listp lsp-lua-workspace-library)
          (dolist (entry lsp-lua-workspace-library)
            (when (consp entry)
              (puthash (car entry) (cdr entry) libraries)))))
        (puthash my/lua-love2d-library-path t libraries)
        (setq-local lsp-lua-workspace-library libraries)))))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . lsp-modeline-mode)
        (lsp-mode . lsp-headerline-breadcrumb-mode)
        (go-mode . lsp-deferred)
        (go-ts-mode . lsp-deferred)
        (lua-mode . my/lua-mode-setup)
        (lua-mode . lsp-deferred)
        (lua-ts-mode . my/lua-mode-setup)
        (lua-ts-mode . lsp-deferred)
        (js-mode . lsp-deferred)
        (js-ts-mode . lsp-deferred)
        (typescript-mode . lsp-deferred)
        (typescript-ts-mode . lsp-deferred)
        (tsx-ts-mode . lsp-deferred)
        (json-mode . lsp-deferred)
        (json-ts-mode . lsp-deferred)
        (python-mode . lsp-deferred)
        (python-ts-mode . lsp-deferred)
        (rust-mode . lsp-deferred)
        (rust-ts-mode . lsp-deferred)
        (zig-mode . lsp-deferred)
        (c-mode . lsp-deferred)
        (c-ts-mode . lsp-deferred)
        (c++-mode . lsp-deferred)
        (c++-ts-mode . lsp-deferred)
        (java-mode . lsp-deferred)
        (java-ts-mode . lsp-deferred)
        (yaml-mode . lsp-deferred)
        (yaml-ts-mode . lsp-deferred)
        (xml-mode . lsp-deferred)
        (nxml-mode . lsp-deferred))
  :init
  (setq lsp-keymap-prefix "C-c l")
  :custom
  (lsp-log-io nil)
  (lsp-auto-configure t)
  (lsp-enable-file-watchers t)
  (lsp-restart 'auto-restart)
  (lsp-auto-guess-root t)
  (lsp-guess-root-without-session t)
  (lsp-headerline-breadcrumb-enable t)
  (lsp-modeline-code-actions-enable t)
  (lsp-modeline-code-actions-prefix "A")
  (lsp-modeline-diagnostics-scope :workspace)
  (lsp-completion-provider :capf)
  (lsp-enable-snippet (package-installed-p 'yasnippet))
  (lsp-signature-auto-activate t)
  (lsp-eldoc-enable-hover t)
  (lsp-idle-delay 0.3)
  :config
  (when (file-exists-p "/opt/homebrew/opt/lua-language-server/libexec/main.lua")
    ;; Homebrew keeps the upstream LuaLS layout under libexec, but its
    ;; default cache path inside that tree is not writable.
    (let ((lua-ls-log-dir (expand-file-name "var/lua-language-server/log" user-emacs-directory))
          (lua-ls-meta-dir (expand-file-name "var/lua-language-server/meta" user-emacs-directory)))
      (make-directory lua-ls-log-dir t)
      (make-directory lua-ls-meta-dir t)
      (setq lsp-clients-lua-language-server-bin "/opt/homebrew/opt/lua-language-server/libexec/bin/lua-language-server")
      (setq lsp-clients-lua-language-server-main-location "/opt/homebrew/opt/lua-language-server/libexec/main.lua")
      (setq lsp-clients-lua-language-server-command
            (list lsp-clients-lua-language-server-bin
                  "-E"
                  lsp-clients-lua-language-server-main-location
                  (format "--logpath=%s" lua-ls-log-dir)
                  (format "--metapath=%s" lua-ls-meta-dir)))))
  (when (file-exists-p (expand-file-name "~/go/bin/gopls"))
    (setq lsp-go-gopls-server-path (expand-file-name "~/go/bin/gopls")))
(dolist (entry '((go-mode . "go")
                    (go-ts-mode . "go")
                    (lua-mode . "lua")
                    (lua-ts-mode . "lua")
                    (js-mode . "javascript")
                    (js-ts-mode . "javascript")
                    (javascript-mode . "javascript")
                    (typescript-mode . "typescript")
                    (typescript-ts-mode . "typescript")
                    (tsx-ts-mode . "typescriptreact")
                    (json-mode . "json")
                    (json-ts-mode . "json")
                    (python-mode . "python")
                    (python-ts-mode . "python")
                    (rust-mode . "rust")
                    (rust-ts-mode . "rust")
                    (zig-mode . "zig")
                    (c-mode . "c")
                    (c-ts-mode . "c")
                    (c++-mode . "cpp")
                    (c++-ts-mode . "cpp")
                    (java-mode . "java")
                    (java-ts-mode . "java")
                    (yaml-mode . "yaml")
                    (yaml-ts-mode . "yaml")
                    (xml-mode . "xml")
                    (nxml-mode . "xml")))
    (add-to-list 'lsp-language-id-configuration entry)))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-show-with-mouse nil)
  (lsp-ui-doc-delay 0.4)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-peek-enable t)
  (lsp-ui-imenu-enable t)
  :config
  (setq lsp-ui-doc-border "#b8bb26")
  (set-face-attribute 'lsp-ui-doc-background nil
                      :background 'unspecified
                      :foreground 'unspecified)
  (set-face-attribute 'lsp-ui-doc-header nil
                      :background 'unspecified
                      :foreground "#ebdbb2"
                      :box 'unspecified)
  (set-face-attribute 'lsp-ui-doc-highlight-hover nil
                      :background 'unspecified
                      :underline '(:style line :color "#fabd2f"))
  (dolist (face '(lsp-face-highlight-textual
                  lsp-face-highlight-read
                  lsp-face-highlight-write))
    (set-face-attribute face nil
                        :inherit nil)
    (set-face-attribute face nil
                        :foreground 'unspecified
                        :background 'unspecified
                        :distant-foreground 'unspecified
                        :box 'unspecified
                        :weight 'normal
                        :slant 'normal
                        :extend nil
                        :underline '(:style line :color "#fabd2f"))))

(defun my/setup-env-modes ()
  "Setup special file modes for .env and .gitignore files."
  (when (and (featurep 'gitignore-mode) (fboundp 'gitignore-mode))
    (gitignore-mode)))

;; dotenv-mode unavailable on package archives

(use-package git-modes
  :mode ("\\.gitignore\\'" "\\.gitattributes\\'" "\\.gitmodules\\'"))

;; dotenv-mode unavailable on package archives

(provide 'lsp-config)
