;; stop creating backup~ files
(setq make-backup-files nil)

;; hide welcome page
(setq inhibit-startup-screen t)

;; show column
(setq column-number-mode t)

;; stop beep sound
(setq visible-bell t)

;; ;; smart inference of indentation style
;; (defun infer-indentation-style ()
;;   ;; if our source file uses tabs, we use tabs, if spaces spaces, and if        
;;   ;; neither, we use the current indent-tabs-mode                               
;;   (let ((space-count (how-many "^  " (point-min) (point-max)))
;;         (tab-count (how-many "^\t" (point-min) (point-max))))
;;     (if (> space-count tab-count) (setq indent-tabs-mode nil))
;;     (if (> tab-count space-count) (setq indent-tabs-mode t))))

;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)


;; Delete selection mode
(delete-selection-mode 1)

;; enable spell check by default
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; auto refresh all buffers
(global-auto-revert-mode 1)

;; line number in all buffers
(global-linum-mode t)
;; (add-hook 'doc-view-mode-hook (lambda() (linum-mode 0)))

;; show parenthesis matched
(show-paren-mode t)

;; ;; change the highlight color
;; (set-face-attribute 'region nil :background "#99C4F7")

;; ;; right to left config
;; (defun set-bidi-env ()
;;   "interactive"
;;   (setq bidi-paragraph-direction 'nil))
;; (add-hook 'org-mode-hook 'set-bidi-env)


;; power line
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)

;; electric pair
(electric-pair-mode 1)
