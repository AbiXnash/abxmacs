(use-package format-all
  :ensure t
  :hook ((prog-mode . format-all-mode)
         (prog-mode . format-all-ensure-formatter))
  :config
  (setq format-all-show-region t)
  (setq format-all-show-errors 'errors)
  (setq-default format-all-default-formatters
                '(("C" clang-format)
                  ("C++" clang-format)
                  ("CSS" prettier)
                  ("Go" gofmt)
                  ("HTML" html-tidy)
                  ("JavaScript" prettier)
                  ("JSON" prettier)
                  ("Lua" stylua)
                  ("Markdown" prettier)
                  ("Python" black)
                  ("Rust" rustfmt)
                  ("SCSS" prettier)
                  ("Shell" shfmt)
                  ("TypeScript" prettier)
                  ("YAML" prettier)
                  ("Zig" zig)))

  (defun format-all-buffer-or-region ()
    "Format the current buffer or region."
    (interactive)
    (if (use-region-p)
        (format-all-region (region-beginning) (region-end))
      (format-all-buffer)))

  (global-set-key (kbd "C-M-\\") #'format-all-buffer-or-region))

(provide 'configs/format-config)
