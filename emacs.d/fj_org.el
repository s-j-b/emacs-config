;; https://www.youtube.com/watch?v=GP8uOU6SSyk
;;
;; - M-x org-agenda
;; -
;; -
;; - 



(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-todo-keyword-faces
      '(("TODO" . "orange")
        ("NEXT" . org-warning)
        ("CANCELED" . (:foreground "blue" :weight bold))
        ))

(setq org-agenda-files '("~/org/todo/todo.org"
                         "~/org/todo/tnr.org"
                         ;"~/org/todo/work.org"
                         ;"~/org/todo/home.org"
                         ))


(setq org-tag-alist
      '(;; PROJECT
        ("@URGENT" . ?u)        
        ("@TNR" . ?t)
        ("@EA" . ?e)
        ("@JOB" . ?j)
        ("@HOME" . ?h)
        ("@FJ" . ?f)
        ("@PEYTON" . ?p)        
        ("@COMMS" . ?c)
        ("@NY" . ?n)
        ("@GYM" . ?g)
        ))

