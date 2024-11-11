;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Basics
(set-face-attribute 'default
                    nil
                    :height 120
                    :family "DejaVu Sans Mono")
(set-face-attribute 'fixed-pitch-serif
                    nil
                    ;; :height 120
                    :family "DejaVu Sans Mono")
(set-face-attribute 'variable-pitch
                    nil
                    :height 120
                    :family "Inter")
					; (add-to-list 'default-frame-alist '(undecorated . t))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(setq use-dialog-box nil)
(tool-bar-mode -1)
(if (not (eq system-type 'darwin))
    (menu-bar-mode -1)
  (menu-bar-mode 1))

(scroll-bar-mode -1)
(blink-cursor-mode -1)
(save-place-mode 1)
(fringe-mode 0)

;; Ivy
;; (require 'ivy)
;; (ivy-mode 1)

;; LaTeX
(use-package auctex
  :ensure t)

;; Themes
(setq custom-safe-themes t)
;; (load-theme 'wombat)
;; (load-theme 'wheatgrass)
;; (load-theme 'adwaita)
;; Evil
;; (setq evil-undo-system 'undo-redo
;;       evil-want-fine-undo t)
;; (require 'evil)
;; (evil-mode 1)

;; Undo
(require 'undo-tree)
(global-undo-tree-mode 1)

;; Embed wayland
(defun sway () (interactive) (call-process "sway"))

;; Pinyin
;; (with-no-warnings (require 'pyim)
;;                   (require 'pyim-basedict)
;;                   (pyim-basedict-enable)
;;                   (setq default-input-method "pyim"))

;; Org
(require 'org)
(setq org-agenda-files '("~/School/")
      org-agenda-start-on-weekday 0)

;; Git
(require 'magit)

;; Lisp
(with-no-warnings (require 'paredit))
(with-no-warnings (require 'sly))

;; Tree sitter
(setq treesit-language-source-alist '((c "https://github.com/tree-sitter/tree-sitter-c")
                                      (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
                                      (go "https://github.com/tree-sitter/tree-sitter-go")
                                      (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown"))
      major-mode-remap-alist '((c-mode . c-ts-mode)
                               (cpp-mode . cpp-ts-mode)))

;; Indentation
(setq tab-width 8
      indent-tabs-mode t
      custom-tab-width 8)
(defun disable-tabs () (interactive)
       (setq indent-tabs-mode nil))
(defun enable-tabs () (interactive)
       (local-set-key (kbd "TAB") 'tab-to-tab-stop)
       (setq indent-tabs-mode t)
       (setq tab-width custom-tab-width))
;; (add-hook 'prog-mode-hook 'enable-tabs)
;; (add-hook 'text-mode-hook 'enable-tabs)
;; (add-hook 'lisp-mode-hook 'disable-tabs)
;; (add-hook 'emacs-lisp-mode-hook 'disable-tabs)
;; (setq-default electric-indent-inhibit t)
;; (setq backward-delete-char-untabify-method 'hungry)


;; IRC
(require 'circe)
(setq lui-fill-column 90)
(setq my-credentials-file "~/.local/share/secrets/irc.el")
(defun my-znc-password (server)
  (with-temp-buffer
  (insert-file-contents-literally my-credentials-file)
    (plist-get (read (buffer-string)) :pass)))
(setq circe-networks '(("libera"
			:host "irc.runxiyu.org"
			:port 26697
			:user "runxiyu/libera"
			:pass my-znc-password
			:use-tls t)
		       ("rx"
			:host "irc.runxiyu.org"
			:port 26697
			:user "runxiyu/rx"
			:pass my-znc-password
			:use-tls t)))

;; Dired
(setq dired-listing-switches "-l")

;; Server
;; (server-start)


;; Warnings
;; (setq warning-minimum-level :emergency) ; bad practice but meh

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(solarized-theme vterm auctex maxima vterm-toggle undo-tree fzf go darkroom sly magit ivy circe)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

