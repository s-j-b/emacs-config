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
;;;;;;;;;;;;;;;;;; INITIAL BASIC SETTINGS ;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
;;   (setenv "PATH" path)
;;   (setq exec-path 
;;         (append
;;          (split-string-and-unquote path ":")
;;          exec-path)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; TURN OFF 
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1) ;; no menu bar
(fringe-mode 0) ;; disable fringes

;;(setq visible-bell -1) ;; visible error bell
(setq select-enable-clipboard t) ;; allow copy paste
(setq inhibit-startup-message t) ;; no startup message

(global-visual-line-mode 1) ;; WRAP LINES instead of long overflow
(global-goto-address-mode 1) ;; clickable links etc.

(add-hook 'window-setup-hook 'on-after-init)
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(put 'upcase-region 'disabled nil)
(global-display-line-numbers-mode 1)
(setq column-number-mode t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; LOAD CONFIG FILES ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file (expand-file-name "fj_packages.el" user-emacs-directory))
(load-file (expand-file-name "fj_preferences.el" user-emacs-directory))
(load-file (expand-file-name "fj_org.el" user-emacs-directory))
(load-file (expand-file-name "fj_modes.el" user-emacs-directory))
(load-file (expand-file-name "fj_functions.el" user-emacs-directory))
(load-file (expand-file-name "fj_ai.el" user-emacs-directory))
(load-file (expand-file-name "fj_test.el" user-emacs-directory))
