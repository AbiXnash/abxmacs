(require 'treesit)

(setq treesit-font-lock-level 4)

(let ((lang-dir (expand-file-name "elpa/tree-sitter-langs-20260420.54/bin" user-emacs-directory)))
  (when (file-directory-p lang-dir)
    (push lang-dir treesit-extra-load-path)))

(add-to-list 'treesit-language-source-alist
             '(lua "https://github.com/tree-sitter-grammars/tree-sitter-lua"))

(when (fboundp 'lua-ts-mode)
  (add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode)))

(provide 'configs/treesitter-config)