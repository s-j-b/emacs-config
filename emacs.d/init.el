;; Define the init file

;;(setq initial-frame-alist '((background-color . "black")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
