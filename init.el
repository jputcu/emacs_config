(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gdb-gud-control-all-threads nil)
 '(gdb-non-stop-setting nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(intero rust-mode markdown-mode haskell-mode ghc fsharp-mode darcsum))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;(add-to-list 'load-path "~/.emacs.d")
(setq make-backup-files nil)
(setq auto-save-default nil)
;;(setq-default indent-tabs-mode t)
(setq-default c-basic-offset 4)
(setq-default show-trailing-whitespace t)
(setq-default tab-width 4)
(tool-bar-mode -1)


(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)


;;
;;  Intel hex
;;
;;(load "intel-hex-mode.el" nil t t)


;;(autoload 'ghc-init "ghc" nil t)
;;(autoload 'ghc-debug "ghc" nil t)
;;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
;; Install Intero
(add-hook 'haskell-mode-hook 'intero-mode)

;;
;; Delphi
;;
(add-to-list 'auto-mode-alist '("\\.pas$" . delphi-mode))

(defadvice gdb-setup-windows (around setup-more-gdb-windows activate)
  ad-do-it
  (gdb-get-buffer-create 'gdb-disassembly-buffer)
  (let ((win4 (get-buffer-window (gdb-get-buffer-create 'gdb-inferior-io))))
	(gdb-set-window-buffer (gdb-disassembly-buffer-name) t win4)))


(load-theme 'tango-dark)
