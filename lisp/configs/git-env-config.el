;; Git-related files
(add-to-list 'auto-mode-alist '("\\.gitignore\\'" . conf-space-mode))
(add-to-list 'auto-mode-alist '("\\.gitattributes\\'" . conf-space-mode))
(add-to-list 'auto-mode-alist '("\\.gitmodules\\'" . conf-space-mode))

;; Environment files
(add-to-list 'auto-mode-alist '("\\.env\\'" . conf-space-mode))
(add-to-list 'auto-mode-alist '("\\.env\\..+" . conf-space-mode))
(add-to-list 'auto-mode-alist '("\\.envrc\\'" . conf-space-mode))

;; Dockerfile and similar
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(add-to-list 'auto-mode-alist '("\\.dockerignore\\'" . conf-space-mode))

;; Makefile
(add-to-list 'auto-mode-alist '("[Mm]akefile\\'" . makefile-mode))

(provide 'git-env-config)