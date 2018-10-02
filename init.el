;;
;; Notes:
;; ======
;; Windows
;; -------
;; set HOME environment variable to '%USERPROFILE%\AppData\Roaming\'
;;
;; ### To open files without extension with emacs
;; Registry key: 'HKEY_CLASSES_ROOT\Unknown'.
;; Add a key 'emacs' to 'shell'
;; Add a key 'command' to 'shell/emacs'
;; Set the default value of 'shell/emacs' to 'C:\msys32\mingw32\bin\runemacs "%1"'
;; and switch the 'default' of 'shell' from 'openas' to 'emacs'
;;


(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Disable beep
(setq visible-bell 1)

(setq make-backup-files nil)
(setq auto-save-default nil)
;;(setq-default indent-tabs-mode t)
(setq-default show-trailing-whitespace t)
(setq-default tab-width 4)
(setq-default inhibit-startup-screen t)

(tool-bar-mode -1)
(load-theme 'tango-dark)



;; General recompile with F7 key
(global-set-key (kbd "<f7>") 'recompile)


;;
;;  Haskell
;;
(use-package intero
  :ensure t)
(add-hook 'haskell-mode-hook 'intero-mode)

;; For Haskell stack yaml files
(use-package yaml-mode
  :ensure t)


;;
;;  F-sharp
;;
(use-package fsharp-mode
  :defer t)


;;
;;  Rust
;;
(use-package rust-mode
  :defer t
  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

;; TODO  :bind ("<f7>" . rust-compile))
(use-package racer
  :ensure t)

(use-package toml-mode
  :ensure t)

;;
;;  Markdown
;;
(use-package markdown-mode
  :ensure t)


;;
;;  Intel hex
;;
(load "~/.emacs.d/intel-hex-mode.el")


;;
;;  C/C++
;;
(setq c-default-style "linux"
      c-basic-offset 4)

(use-package xcscope
  :ensure t)

;; Nice project tree
(use-package neotree
  :ensure t)


;;(defadvice gdb-setup-windows (around setup-more-gdb-windows activate)
;;  ad-do-it
;;  (gdb-get-buffer-create 'gdb-disassembly-buffer)
;;  (let ((win4 (get-buffer-window (gdb-get-buffer-create 'gdb-inferior-io))))
;;	(gdb-set-window-buffer (gdb-disassembly-buffer-name) t win4)))


;; Keep emacs custom configuration out of this version controlled file!
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)


;;
;;  CMake
;;
(use-package cmake-mode
  :ensure t)


;;
;;  Start a cmd prompt here
;;
(defun start-cmd ()
  (interactive)
  (let ((proc (start-process "cmd" nil "cmd.exe" "/C" "start" "cmd.exe")))
	(set-process-query-on-exit-flag proc nil)
	)
)
