
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

