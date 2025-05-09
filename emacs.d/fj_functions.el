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
(global-set-key (kbd "C--") 'bar)

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
  (interactive)  
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

