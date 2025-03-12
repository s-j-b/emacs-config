;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; FJ Setup - Org Mode Etc. ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"))





(global-set-key (kbd "C-x C-x") 'goto-line)
(global-set-key (kbd "C-x C-w") 'kill-whole-line)

(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)

(global-set-key (kbd "C-z") 'undo)

(global-set-key (kbd "C-c f") 'find-name-dired)


(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(set-face-background 'fringe "#000000")

(require 'multiple-cursors)            
(global-set-key (kbd "C-c /") 'mc/edit-lines) 

(global-set-key (kbd "C-c '") 'mc/mark-next-like-this) 
(global-set-key (kbd "C-c ;") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c .") 'mc/mark-all-like-this)
(put 'upcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-cursor-color "#FFF")
(set-face-attribute 'region nil :background "#353135")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-face-attribute 'menu nil
                    :inverse-video nil
                    :background "black"
                    :bold t)

