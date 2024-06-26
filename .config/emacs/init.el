(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(ivy circe evil)))
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(setq circe-network-options
      '(("rx"
         :tls t
	 :port 6697
         :tls-keylist (("/home/runxiyu/.local/share/secrets/irc.pem"
                        "/home/runxiyu/.local/share/secrets/irc.pem"))
         :sasl-external t
         :nick "runxiyu_circe"
         :channels ("#chat")
         )))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
