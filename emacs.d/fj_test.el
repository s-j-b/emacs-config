;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; SCRATCH ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq denote-directory "~/org/dnotes/")
(setq denote-file-name-components-order '(identifier signature keywords title))


(defun my-denote-get-title (filename)
  "Extract the title from a Denote filename.
Returns the title or nil if not a Denote file."
  (when (and filename
             (string-prefix-p (expand-file-name "~/org/dnotes/") filename)
             (string-match-p "\\([0-9]\\{8\\}T[0-9]\\{6\\}\\)_\\{2\\}.*--\\(.*\\)\\.org\\'" filename))
    (let ((title (file-name-base filename)))
      (when (string-match "--\\(.*\\)$" title)
        (match-string 1 title)))))

(defun my-denote-rename-buffer ()
  "Rename buffer to the title of a Denote file when opened in Org mode."
  (when (and buffer-file-name
             (derived-mode-p 'org-mode)
             (my-denote-get-title buffer-file-name))
    (let ((title (my-denote-get-title buffer-file-name)))
      (rename-buffer (generate-new-buffer-name title)))))

(add-hook 'find-file-hook #'my-denote-rename-buffer)


;;(setq denote-file-name-scheme 'custom)
;;(setq denote-date-format "%Y-%m-%d-T%H-%M")
;;(setq denote-id-format "%Y-%m-%d-T%H-%M")




;; org politics emacs economics philosophy
;;/Users/jupiter/.emacs.d/fj_packages.el



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
