;; vscode dark them
(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; which key mode
(which-key-mode)

;; company mode
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-'") 'company-complete) ; show completion suggestions by using tab key
;; some improvement to company mode
(setq company-minimum-prefix-length 1)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0.7)

;; company quick help
(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1)
  (setq company-quickhelp-color-background "#303030")
  (setq company-quickhelp-color-foreground "#D0CFCC")
  )

;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-indentation  1)
    ;; (treemacs-indent-guide-mode t)
    )
  :bind
  (("M-0" . treemacs-select-window)))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)


;; yasnippet
(yas-global-mode 1)

;; Drag Stuff
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)


;; enable yasnippet with company mode
(defun autocomplete-show-snippets ()
  "Show snippets in autocomplete popup."
  (let ((backend (car company-backends)))
    (unless (listp backend)
      (setcar company-backends `(,backend :with company-yasnippet company-files)))))
;; See http://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html
;; for what this line means
(add-hook 'after-change-major-mode-hook 'autocomplete-show-snippets)


;; company restclient
(add-to-list 'company-backends 'company-restclient)

;; indent guide
(indent-guide-global-mode)


;; mode-icons
(mode-icons-mode 1)

;; all-the-icons
(when (display-graphic-p)
  (require 'all-the-icons))

;; doom-modeline
(use-package doom-modeline
  :config
  (doom-modeline-mode 1))


;;centaur tabs
(centaur-tabs-mode t)
(global-set-key (kbd "C-{")  'centaur-tabs-backward)
(global-set-key (kbd "C-}") 'centaur-tabs-forward)
(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-bar 'under)
(setq x-underline-at-descent-line t)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-show-navigation-buttons t)
(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*epc" name)
     (string-prefix-p "*EGLOT" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*company" name)
     (string-prefix-p "*tramp" name)
     (string-prefix-p "*Flymake" name)
     (string-prefix-p "*help" name)
     (string-prefix-p "*straight" name)
     (string-prefix-p " *temp" name)
     (string-prefix-p "*Help" name)
     (string-prefix-p "*mybuf" name)
     (string-prefix-p "*Messages" name)
     (string-prefix-p "*format-all-errors*" name)
     (string-prefix-p "*scratch*" name)
     (string-prefix-p "*Warnings*" name)
     (string-prefix-p "Treemacs Update Single File Process" name)
     (string-prefix-p "*Async-native-compile-log*" name)
     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
	  (not (file-name-extension name)))
     )))

;; multiple-cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; editorconfig
(editorconfig-mode 1)

;; ivy
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


;; switch-window
(global-set-key (kbd "C-x o") 'switch-window)
(setq switch-window-shortcut-style 'qwerty)

;; format-all
(global-set-key (kbd "C-S-i") 'format-all-buffer)

;; all-the-icons-ivy-rich
(all-the-icons-ivy-rich-mode 1)

;; ivy-rich
(ivy-rich-mode 1)

;; dotenv mode
(add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . dotenv-mode))

;; dashboard
(use-package dashboard
  :after all-the-icons
  :init
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda . 5)))
  (setq dashboard-set-heading-icons t
        dashboard-projects-backend 'project-el
        dashboard-startup-banner 'official
        dashboard-banner-logo-title ""
        dashboard-image-banner-max-height 500
        dashboard-set-footer nil
        dashboard-set-file-icons t
        dashboard-set-init-info t)
  (dashboard-setup-startup-hook))

;; ;; aggressive-indent
;; (use-package aggressive-indent
;;   :config
;;   (global-aggressive-indent-mode 1))

;; eldoc-box
;; (use-package eldoc-box
;;   :init
;;   (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-at-point-mode t)
;;   :config
;;   (setq x-gtk-resize-child-frames 'resize-mode))


(provide 'init-global)
;;; init-global.el ends here
