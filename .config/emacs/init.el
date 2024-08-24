(set-face-attribute 'default nil :height 180 :family "monospace")

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(save-place-mode 1)

; (load-theme 'wheatgrass)
; (load-theme 'adwaita)

(require 'ivy)
(ivy-mode 1)

(with-no-warnings (require 'paredit))
(with-no-warnings (require 'sly))

(add-to-list 'default-frame-alist '(undecorated . t))

(global-unset-key (kbd "C-z"))

(setq use-dialog-box nil)

(setq treesit-language-source-alist
      '((c "https://github.com/tree-sitter/tree-sitter-c")
	(cpp "https://github.com/tree-sitter/tree-sitter-cpp")
	(markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown")))
(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
	(cpp-mode . cpp-ts-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(sly markdown-mode paredit ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
