;;--------------------------------------------------------------------------
;; repo list
;;--------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; solve network problem
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;;--------------------------------------------------------------------------
;; loading files
;;--------------------------------------------------------------------------
(load "~/.emacs.d/general-config") ; general configuration lisp file
(add-to-list 'load-path "~/.emacs.d/lisp") ; packages configuration file
(load "packages")
(load "global")
(load "javascript-lisp")
(load "web-lisp")
;;--------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita)))
 '(package-selected-packages
   (quote
    (org drag-stuff idle-highlight-mode company-web web-mode helm react-snippets js2-mode company yasnippet yasnippet-snippets which-key treemacs tabbar switch-window rjsx-mode php-mode markdown-mode emmet-mode company-quickhelp autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
