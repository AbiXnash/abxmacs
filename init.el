;; Load all config files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'package-config)
(require 'ivy-config)
(require 'modeline-config)
(require 'theme-config)
(require 'ui-config)
(require 'options-config)
(require 'linum-config)
(require 'projectile-config)
(require 'magit-config)
(require 'git-env-config)
(require 'qol-config)
(require 'lsp-config)
(require 'company-config)
(require 'flycheck-config)
(require 'format-config)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
