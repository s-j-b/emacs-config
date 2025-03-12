;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; INTRODUCTION ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


"""
SJB Emacs Init File
---------------
Name: Simon J. Bloch
Date Created: May 2015
Last Updated: March 2025
"""


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; PACKAGE MANAGEMENT ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")))

; Apparently needed for the package auto-complete (why?)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(setq url-http-attempt-keepalives nil)

;; Theme
(use-package gruvbox-theme
  :ensure t
  :init
  (setq gruvbox-theme-kit t)
  :config
  (load-theme 'gruvbox t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" default))
 '(package-selected-packages
   '(react-snippets js3-mode markdown-mode gptel jtsx rjsx-mode typescript-mode multiple-cursors gruvbox-theme gruvbox-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; Editing Modes ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq sgml-basic-offset 4)
(setq c++-basic-offset 4)
(setq c-basic-offset 4)
(setq python-basic-offset 4)
(setq sh-basic-offset 4)
(setq latex-basic-offset 4)
(setq text-basic-offset 4)
(setq emacs-lisp-basic-offset 4)
(setq js-basic-offset 4)
(setq html-basic-offset 2)

(setq select-enable-clipboard nil)

;; Add TypeScript mode for .tsx files
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;; Enable JSX syntax highlighting in TypeScript mode
(add-hook 'typescript-mode-hook 'js-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Add indent hooks for specific languages
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq python-indent 4)))

(add-hook 'js-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)
            (setq js-indent 2)))
(setq js-indent-level 2)

(add-hook 'html-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)
            (setq html-indent 2)))
(setq html-indent-level 2)
(setq indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; linum mode

(global-display-line-numbers-mode 1)

(set-face-attribute 'region nil :background "#2b3030")


(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq linum-format "%d ")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; FJ Setup - Org Mode Etc. ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Custom Functions ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                       ; GIT PUSH [M-g M-g]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun git-push ()
  (interactive)
  (setq prompt "Commit Message: ")
  (setq input (read-from-minibuffer prompt))
  (setq mac_git
        (concat
         "\C-x\C-s"
         "^[!git add .^M"
         "^[!git commit -m \""
         input
         "\"^M^[!git push^M"
         )
        )
  (fset 'git_push mac_git)
  (execute-kbd-macro 'git_push)
  )
(global-set-key (kbd "M-g M-g") 'git-push)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                       ; COMMENT LINE [C-_]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun bar ()
  (interactive)

  (setq mode (message "%s" major-mode))
  (setq ch "-")
  (if (string-equal "c-mode" mode) (setq ch "/"))
  (if (string-equal "js-mode" mode) (setq ch "/"))
  (if (string-equal "sh-mode" mode) (setq ch "#"))  
  (if (string-equal "c++-mode" mode) (setq ch "/"))
  (if (string-equal "sql-mode" mode) (setq ch "-"))
  (if (string-equal "text-mode" mode) (setq ch "/"))
  (if (string-equal "latex-mode" mode) (setq ch "%"))
  (if (string-equal "python-mode" mode) (setq ch "#"))
  (if (string-equal "emacs-lisp-mode" mode) (setq ch ";"))
  (if (string-equal "fundamental-mode" mode) (setq ch "-"))  
  (setq commentline
        (concat
         "\C-a\C-u60"
         ch
         "\C-m"
         )
        )
  (fset 'hashline commentline)
  (execute-kbd-macro 'hashline)
  )

(global-set-key (kbd "C-_") 'bar)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CUSTOM COMMENT [C-^]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun custom-comment ()
  (setq mode (message "%s" major-mode))
  
  (interactive)
  (setq custom_cmd "
{
    /* ++++++++++++++++
       o section A
       ---------------- */
  }
")
  (fset 'print_cmd custom_cmd)
  (execute-kbd-macro 'print_cmd)
  )
(global-set-key (kbd "C-^") 'custom-comment)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                       ; SECTION COMMENT [M-s M-c]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun section-comment ()
  (setq mode (message "%s" major-mode))
  (setq ch "/")

  (if (string-equal "c-mode" mode) (setq ch "/"))
  (if (string-equal "sh-mode" mode) (setq ch "#"))
  (if (string-equal "c++-mode" mode) (setq ch "/"))
  (if (string-equal "sql-mode" mode) (setq ch "-"))
  (if (string-equal "text-mode" mode) (setq ch "/"))
  (if (string-equal "latex-mode" mode) (setq ch "%"))
  (if (string-equal "python-mode" mode) (setq ch "#"))
  (if (string-equal "emacs-lisp-mode" mode) (setq ch ";"))
  (if (string-equal "fundamental-mode" mode) (setq ch "-"))
  
  (interactive)
  (setq prompt "Section Comment: ")
  (setq input (read-from-minibuffer prompt))
  (setq str_len (length input))
  (setq tot_len 60)
  (setq indent (+ (/ str_len 2) 1))
  (setq outdent (+ (- str_len indent) 1))
  (setq num_hash (- tot_len (+ str_len 2)))
  (setq indent (/ num_hash 2))
  (setq outdent (- num_hash indent))
  (setq mac_com "\C-a\C-m\C-_\C-u")
  (setq mac_com
        (concat
         mac_com
         (number-to-string indent)
         ch
         " "
         input
         " \C-u"
         (number-to-string outdent)
         ch
         "\C-m\C-_\C-m"
         )
        )
  (fset 'print_comment mac_com)
  (execute-kbd-macro 'print_comment)
  )
(global-set-key (kbd "M-s M-c") 'section-comment)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                       ; EVAL AND REPLACE [C-c e]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-c e") 'eval-and-replace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                       ; COMMENT COUNTER [C-c i]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun comment-counter ()
  (interactive)

  (setq mode (message "%s" major-mode))

  (setq beg "print(\"")
  (if (string-equal "c++-mode" mode) (setq beg "printf(\""))
  (if (string-equal "c-mode" mode) (setq beg "printf(\""))
  (if (string-equal "python-mode" mode) (setq beg "print(\""))
  
  (setq end " --->\")")

  (insert beg)
  (insert "$$$ <--- ")
  (kmacro-insert-counter 1)
  (insert end)
  )
(global-set-key (kbd "C-c C-m") 'comment-counter)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                       ; REMOVE PRINTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun remove-prints ()
  "Replace the preceding sexp with its value."
  (interactive)
  (beginning-of-buffer)

  (setq str "$")
  (while (re-search-forward str nil)
    (insert "OK")
    )
  )
                                        ;    (setf
                                        ;     (point) (match-beginning 0)
                                        ;     (mark) (match-end 0))))

                                        ;    (insert "--here--")
                                        ;    (if (y-or-n-p "Do it?")
                                        ;        (progn
                                        ;          (beginning-of-line)
                                        ;          (kill-line)
                                        ;          )
                                        ;      (progn
                                        ;        (newline)
                                        ;        )
                                        ;      )
                                        ;    )
                                        ;  )

(global-set-key (kbd "C-c C-r") 'remove-prints)


(defun clog ()
  (interactive)
  (fset 'kbd-clog
        "\C-a\C-i\C-@\C-e\C-wconsole.log(\"\C-u40~\");\C-mcos\C-?mnso\C-?\C-?\C-?\C-?nsoe\C-?le.log(\"- - - - - \", \C-?\C-?\C-?\C-y - - - - - \C-?\");\C-mconsole.log(\C-y);\C-mconsoo\C-?le.log(\"|_______________________________________\");\C-m\C-x\C-s")
  (execute-kbd-macro 'kbd-clog)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                       ; LINE JUMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun move-10-up ()
  (interactive)
  (setq up_10_cmd "\C-u10\C-p")
  (fset 'jump_up up_10_cmd)
  (execute-kbd-macro 'jump_up)
  )
(global-set-key (kbd "M-p") 'move-10-up)

(defun move-10-down ()
  (interactive)
  (setq down_10_cmd "\C-u10\C-n")
  (fset 'jump_down down_10_cmd)
  (execute-kbd-macro 'jump_down)
  )
(global-set-key (kbd "M-n") 'move-10-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                       ; LINE LENGTH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dot-line ()
  "Length of the Nth line."
  (interactive)

  (setq ln (string-to-number (substring (what-line) 5)))

  (save-excursion
    
    (if (zerop (forward-line (1- ln)))
        (setq len (- (line-end-position)
                     (line-beginning-position))))
    (setq tot 69)
    (setq ch 46)
    (setq sp 32)

    (setq times (- tot len))
    (end-of-line)
    (insert sp)
    (dotimes (num times val)
      (insert ch))
    )
  )
(global-set-key (kbd "C-c l") 'dot-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;  Final Configs


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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; SETUP AI/LLMS ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq
 gptel-model "claude-3-opus-20240229" ;"claude-3-sonnet-20240229" also available
 gptel-backend (gptel-make-anthropic "Claude"
                 :stream t :key (getenv "ANTHROPIC_CLAUDE_API_KEY")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
