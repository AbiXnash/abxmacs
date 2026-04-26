(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-remember-project-changes t))

(use-package recentf
  :init
  (recentf-mode 1)
  (setq recentf-max-saved-items 100)
  (setq recentf-auto-cleanup 'never)
  (add-to-list 'recentf-exclude ".*\\/\\.cache\\/.*"))

(defvar my/harpoon-list nil "List of harpooned files.")

(defun my/harpoon-add ()
  "Add current file to harpoon list."
  (interactive)
  (let ((file (buffer-file-name)))
    (when file
      (unless (member file my/harpoon-list)
        (push file my/harpoon-list)
        (message "Added to harpoon: %s" (file-name-nondirectory file))))))

(defun my/harpoon-remove ()
  "Remove current file from harpoon list."
  (interactive)
  (let ((file (buffer-file-name)))
    (when file
      (setq my/harpoon-list (delete file my/harpoon-list))
      (message "Removed from harpoon"))))

(defun my/harpoon-goto (index)
  "Go to harpoon file by INDEX (1-4)."
  (let ((target (nth (1- index) my/harpoon-list)))
    (if (and target (file-exists-p target))
        (find-file target)
      (message "No harpoon file at index %d" index))))

(defun my/harpoon-show ()
  "Show harpoon list."
  (interactive)
  (message "Harpoon: %s"
           (mapconcat (lambda (f) (file-name-nondirectory f))
                      my/harpoon-list
                      " | ")))

(global-set-key (kbd "C-c p a") #'my/harpoon-add)
(global-set-key (kbd "C-c p r") #'my/harpoon-remove)
(global-set-key (kbd "C-c p 1") (lambda () (interactive) (my/harpoon-goto 1)))
(global-set-key (kbd "C-c p 2") (lambda () (interactive) (my/harpoon-goto 2)))
(global-set-key (kbd "C-c p 3") (lambda () (interactive) (my/harpoon-goto 3)))
(global-set-key (kbd "C-c p 4") (lambda () (interactive) (my/harpoon-goto 4)))
(global-set-key (kbd "C-c p s") #'my/harpoon-show)

(provide 'configs/harpoon-config)