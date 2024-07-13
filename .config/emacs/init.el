;; Partially stolen from vulpine/xfnw

;; Packages
(require 'package)
(add-to-list 'package-archives
             (cons "nongnu" "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives
             (cons "melpa" "https://melpa.org/packages/"))
(package-initialize)
(setq package-selected-packages '(ivy circe evil company format-all))

;; Keys
(global-set-key (kbd "C-x M-r") 'rename-buffer)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
(global-set-key (kbd "<f12>") 'buffer-menu)

;; Font size
(set-face-attribute 'default nil :height 100 :family "DejaVu Sans Mono") ; hardcoding, because Emacs on OS X doesn't respect fontconfig

;; Misc
(load-theme 'deeper-blue)
(setq inhibit-startup-screen t)
(require 'ivy)
(require 'company)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(fringe-mode -1)
(ivy-mode 1)

;; Company
(defun turn-off-company () (company-mode -1))
(add-hook 'term-mode-hook 'turn-off-company)
(add-hook 'circe-mode-hook 'turn-off-company)

;; Org
(require 'org)
(setq org-startup-indented 1)

;; Dired
(setq dired-listing-switches "-l")

;; Line numbering
					; (global-display-line-numbers-mode 1)
(defun turn-off-line-numbers () (display-line-numbers-mode 0))
(defun turn-on-line-numbers () (display-line-numbers-mode 1))


;; Gnus
(setq user-mail-address "me@runxiyu.org"
      user-full-name "Runxi Yu"
      smtpmail-smtp-server "mail.runxiyu.org"
      send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 465)

;; Unsorted variables
(setq circe-server-send-unknown-command-p t
      circe-use-cycle-completion t
      company-minimum-prefix-length 4
      company-quick-access-modifier 'super
      company-selection-wrap-around t
      company-show-quick-access t
      eldoc-echo-area-use-multiline-p nil
      evil-undo-system 'undo-redo
      evil-want-C-u-scroll t
      eww-search-prefix "https://google.com/search?q="
      global-company-mode t
      inferior-lisp-program "ecl"
      ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"]
      auth-source-save-behavior nil
      backup-directory-alist `(("." \, (concat user-emacs-directory "backups")))
      browse-url-browser-function 'eww-browse-url
      c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "bsd"))
      circe-default-part-message "Leaving"
      circe-default-quit-message "Leaving"
      circe-format-self-say "<{nick}> {body}"
      circe-format-server-netmerge "*** Netjoin: {split}, split {ago} ago (Use /WL to see who's still missing)"
      circe-format-server-quit "*** Quit: {nick} ({userhost}) quit ({reason})"
      circe-format-server-quit-channel "*** Quit: {nick} ({userhost}) quit ({reason})"
      circe-format-server-topic "*** Topic change by {nick} ({userhost}): {topic-diff}"
      initial-scratch-message ""
      lui-fill-column 105
      lui-logging-directory (concat user-emacs-directory "irclogs")
      lui-logging-flush-delay 2
      nxml-auto-insert-xml-declaration-flag t
      nxml-slash-auto-complete-flag t
      org-agenda-files '(".")
      org-agenda-start-on-weekday 0
      org-default-notes-file "~/org/index.org"
      org-footnote-define-inline t
      org-latex-default-packages-alist '(("AUTO" "inputenc" t ("pdflatex")) ("T1" "fontenc" t ("pdflatex")) ("" "graphicx" t nil) ("" "longtable" nil nil) ("" "wrapfig" nil nil) ("" "rotating" nil nil) ("normalem" "ulem" t nil) ("" "amsmath" t nil) ("" "amssymb" t nil) ("" "capt-of" nil nil) ("pdfa" "hyperref" nil nil))
      org-latex-image-default-width "\\linewidth"
      org-src-preserve-indentation t
      org-startup-folded 'content
      org-structure-template-alist '(("a" . "export ascii") ("c" . "center") ("C" . "comment") ("e" . "example") ("E" . "export") ("h" . "export html") ("l" . "export latex") ("q" . "quote") ("s" . "src") ("v" . "verse") ("f" . "fixme") ("d" . "chat"))
      org-support-shift-select t
      org-todo-keywords '((sequence "TODO" "DELAYED" "RERUN" "|" "DONE"))
      org-use-sub-superscripts '{}
      ses-after-entry-functions '(next-line)
      sudo-edit-indicator-mode t
      tab-always-indent nil
      use-short-answers t
      split-height-threshold nil
      split-width-threshold 160)



(defvar move-file-default-target "~/" "move-file's default target")

;; borrowed from https://emacs.stackexchange.com/a/45910/37594
(defun move-file ()
  "Move current to another directory, for which you're prompted.
Directory defaults to the value of 'move-file-default-target'."
  (interactive)
  (let ((old  (or (buffer-file-name)  (user-error "Not visiting a file")))
        (dir  (read-directory-name "Move to: " move-file-default-target)))
    (write-file (expand-file-name (file-name-nondirectory old) dir) t)
    (delete-file old)))


(require 'evil)
(define-key evil-insert-state-map [S-left] nil)
(define-key evil-insert-state-map [S-right] nil)
(evil-set-initial-state 'term-mode 'emacs)
(evil-set-initial-state 'circe-mode 'emacs)
(evil-set-initial-state 'ses-mode 'emacs)
(evil-mode 1)

					; (evil-define-operator evil-fill-justify (beg end)
					;   "fill justified text."
					;   :move-point nil
					;   :type line
					;   (save-excursion
					;     (condition-case nil
					;         (fill-region beg end "fill")
					;       (error nil))))
					; (define-key evil-normal-state-map "gj" 'evil-fill-justify)

(require 'elisp-mode)
(define-key lisp-mode-shared-map (kbd "C-c C-c") 'eval-defun)

(display-time-mode 1)

(require 'text-mode)
(add-to-list 'auto-mode-alist '("\\.gm\\'" . text-mode))
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

(setenv "EDITOR" "emacsclient")

(require 'eww)
(define-key eww-mode-map "u" 'eww-back-url)
(define-key eww-mode-map "g" 'eww)
(define-key eww-mode-map "G" 'eww-reload)
(define-key eww-mode-map (kbd "C-x w") 'eww-copy-page-url)

					; (add-hook 'org-mode-hook 'turn-on-auto-fill)
					; (add-hook 'text-mode-hook 'turn-on-auto-fill)

(require 'eglot)

(define-key company-mode-map (kbd "C-<tab>") 'company-complete)
					; (server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(vterm magit ivy circe evil company format-all)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'magit)
