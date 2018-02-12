(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(setq make-backup-files nil)
(setq auto-save-default nil)
;;(setq-default indent-tabs-mode t)
(setq-default c-basic-offset 4)
(setq-default show-trailing-whitespace t)
(setq-default tab-width 4)

(tool-bar-mode -1)
(load-theme 'tango-dark)


;;
;;  Haskell
;;
(use-package intero
  :ensure t)
(add-hook 'haskell-mode-hook 'intero-mode)


;;
;;  Markdown
;;
(use-package markdown-mode
  :ensure t)


;;
;;  Intel hex
;;
(load "~/.emacs.d/intel-hex-mode.el")


;; Nice project tree
(use-package neotree
  :ensure t)


;;(defadvice gdb-setup-windows (around setup-more-gdb-windows activate)
;;  ad-do-it
;;  (gdb-get-buffer-create 'gdb-disassembly-buffer)
;;  (let ((win4 (get-buffer-window (gdb-get-buffer-create 'gdb-inferior-io))))
;;	(gdb-set-window-buffer (gdb-disassembly-buffer-name) t win4)))


;;
;;  Misc
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(neotree use-package rust-mode markdown-mode intero ghc fsharp-mode darcsum))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
