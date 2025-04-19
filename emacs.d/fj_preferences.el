;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; THEMES ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package gruvbox-theme
;;   :ensure t
;;   :config
;;   (load-theme 'gruvbox t))
(load-theme 'doom-zenburn t)
;;(load-theme 'doom-gruvbox t)

;;(set-face-attribute 'default nil :background "#282828") ;; Example dark grey
;;(set-face-attribute 'highlight nil :background "#aa5050")
(set-face-background 'default "#303030")  ;; Darker background than standard Zenburn

;; Custom highlight/region color
(set-face-attribute 'region nil :background "#404040")  ;; Slightly bluish dark gray
(set-face-attribute 'line-number nil :background "#242424")
(set-face-attribute 'default nil :foreground "#bcbcac")
(set-face-attribute 'vertico-current nil :background "#242424")
(set-face-attribute 'cursor nil :background "#F8A")


(use-package markdown-mode)
;; More specific customization for markdown code blocks
(set-face-attribute 'markdown-code-face nil
                    :background "#383838"
                    :foreground nil          ;; Keep default text color
                    :inherit 'fixed-pitch)   ;; Use monospace font

;; For fenced code blocks specifically (the triple backtick ones)
(set-face-attribute 'markdown-pre-face nil
                    :background "#383838"
                    :inherit 'markdown-code-face)

(use-package nerd-icons)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 20))
  :config
  ;; Set custom colors for active and inactive modelines
  (custom-set-faces
   ;; Active modeline - make it stand out with a deeper color
   '(mode-line ((t (:background "#4e4e4e" :foreground "#dcdccc"))))
   
   ;; Inactive modeline - make it more subdued
   '(mode-line-inactive ((t (:background "#404040" :foreground "#8f8f8f"))))
   )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x C-x") 'goto-line)
(global-set-key (kbd "C-x C-w") 'kill-whole-line)

;;(global-set-key (kbd "M-i") 'previous-line)
;;(global-set-key (kbd "M-k") 'next-line)
;;(global-set-key (kbd "M-j") 'backward-char)
;;(global-set-key (kbd "M-l") 'forward-char)

(global-set-key (kbd "C-z") 'undo)

(global-set-key (kbd "C-c f") 'find-name-dired)



;; Set up fonts with fallbacks for symbols
(set-face-attribute 'default nil :font "Inconsolata Nerd Font-15")
(set-fontset-font t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend)
(set-fontset-font t nil (font-spec :family "Symbola") nil 'append)

;; TODO: ORG INDENT BY DEFAULT
