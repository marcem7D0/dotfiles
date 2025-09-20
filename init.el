(setq inhibit-startup-message t)
(setq make-backup-files nil)

(setq ring-bell-function 'ignore)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font "Hack Nerd Font 11" nil t)

(global-display-line-numbers-mode 1)
(hl-line-mode 1)
(which-key-mode 1)
(auto-fill-mode 1)

(flymake-mode 1)

(setq warning-minimum-level :error)

(setq scroll-margin 15)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(use-package auto-package-update
  :ensure t)

(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package eat
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package dired-icon
  :ensure t
  :hook ((dired-mode-hook . dired-icon-mode)))

(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin t))

(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1))

(use-package multiple-cursors
  :ensure t
  :config (multiple-cursors-mode 1)
  :bind ("C-c n" . set-rectangular-region-anchor))

(use-package move-text
  :ensure
  :config
  (move-text-default-bindings))

(use-package page-break-lines
  :ensure t
  :config
  (page-break-lines-mode))

(use-package ripgrep
  :ensure t)

(use-package projectile
  :ensure t
  :bind
  (("C-c p" . projectile-command-map)
   ("C-c r" . projectile-ripgrep))
  :config
  (projectile-mode +1)
  (setq projectile-indexing-method 'hybrid))

(use-package all-the-icons
  :ensure t)

(use-package nerd-icons
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package magit
  :ensure t)

(use-package helm
  :ensure t
  :bind
  (("C-x b" . helm-buffers-list)
   ("C-x C-f" . helm-find-files)))

(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))

(use-package helm-rg
  :ensure t
  :bind ("C-x f" . helm-rg))
  
(use-package tree-sitter-langs
  :ensure t)

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports"))

(use-package json-mode
  :ensure t)

(use-package eglot
  :config
  :hook ((go-ts-mode python-ts-mode) . eglot-ensure)
  :bind (("C-x q" . eglot-code-actions)
	 ("C-x r" . eglot-rename))
  :custom
  (eglot-workspace-configuration '((:gopls .((staticcheck . t ))))))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate
   #'command-completion-default-include-p))

(defun other-window-backwards ()
  (interactive)
  (other-window -1))

(defun eglot-format-before-save ()
  (when (bound-and-true-p eglot--managed-mode)
    (eglot-format)))

(defun projectile-dired-icons-setup ()
  (when (derived-mode-p 'dired-mode)
    (dired-icon-mode)))

(defun delete-whole-line ()
  (interactive)
  (move-beginning-of-line nil)
  (set-mark-command nil)
  (move-end-of-line nil)
  (backward-delete-char-untabify 1)
  (backward-delete-char-untabify 1))

(add-hook 'projectile-after-switch-project-hook 'projectile-dired-icons-setup)
(add-hook 'before-save-hook #'eglot-format-before-save)

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq tab-width 2)
            (setq js-indent-level 2)))

(keymap-global-set "C-x 2" 'split-window-right)
(keymap-global-set "C-x 3" 'split-window-below)
(keymap-global-set "C-x p" 'other-window-backwards)
(keymap-global-set "C-x t" 'eat)
(keymap-global-set "C-x l" 'delete-whole-line)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons auto-package-update catppuccin-theme company corfu
		   dashboard dired-icon eat exec-path-from-shell
		   flycheck go-mode helm-projectile helm-rg json-mode
		   magit move-text multiple-cursors nerd-icons
		   page-break-lines rainbow-delimiters ripgrep
		   telephone-line tree-sitter-langs treesit-auto xclip)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


