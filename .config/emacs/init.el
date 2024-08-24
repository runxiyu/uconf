;; Basics
(set-face-attribute 'default nil :height 180 :family "monospace")
(add-to-list 'default-frame-alist '(undecorated . t))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(setq use-dialog-box nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(save-place-mode 1)
; (require 'ivy)
; (ivy-mode 1)
(setq custom-safe-themes t)
(load-file "~/.config/emacs/runxiyu-theme-theme.el")
(load-theme 'runxiyu-theme)
; (load-theme 'wheatgrass)
; (load-theme 'adwaita)

;; Embed wayland
(defun sway () (interactive) (call-process "sway"))

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Pinyin
; (with-no-warnings (require 'pyim)
;                   (require 'pyim-basedict)
;                   (pyim-basedict-enable)
;                   (setq default-input-method "pyim"))

;; Org
(require 'org)
(setq org-agenda-files '("~/orp/" "~/org/" "~/od/ibdp/")
      org-agenda-start-on-weekday 0
      org-default-notes-file "~/org/index.org")

;; Git
(require 'magit)

;; Lisp
(with-no-warnings (require 'paredit))
(with-no-warnings (require 'sly))

;; Tree sitter
(setq treesit-language-source-alist '((c "https://github.com/tree-sitter/tree-sitter-c")
                                      (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
                                      (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown"))
      major-mode-remap-alist '((c-mode . c-ts-mode)
                               (cpp-mode . cpp-ts-mode)))

;; Indentation
(setq c-default-style "linux"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)
(setq custom-tab-width 8)
(defun disable-tabs () (interactive) (setq indent-tabs-mode nil))
(defun enable-tabs  () (interactive)
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))
(add-hook 'prog-mode-hook 'enable-tabs)
(add-hook 'text-mode-hook 'enable-tabs)
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)
(setq-default electric-indent-inhibit t)
(setq backward-delete-char-untabify-method 'hungry)


;; IRC
(require 'circe)
(setq lui-fill-column 85)
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

;; Server
(server-start)

;; Others
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(solarized-theme circe pyim-basedict pyim pinyin vterm magit sly markdown-mode paredit ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Warnings
; (setq warning-minimum-level :emergency) ; bad practice but meh

