;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; SETUP AI/LLMS ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;(setq
;; gptel-model "claude-3-opus-20240229" ;"claude-3-sonnet-20240229" also available
;; gptel-backend (gptel-make-anthropic "Claude"
;;                 :stream t :key (getenv "ANTHROPIC_CLAUDE_API_KEY")))

;;(setq
;; gptel-model 'deepseek-chat  ; deepseek-reasoner/deepseek-chat --> Alt. model
;; gptel-backend (gptel-make-deepseek "DeepSeek"
;;                 :host "https://api.deepseek.com"
;;                 :stream t
;;                 :endpoint "/v1/chat/completions"
;;                 :key (getenv "DEEPSEEK_API_KEY")))

(setq
 gptel-model 'gemini-2.0-flash-thinking-exp-01-21
 gptel-backend (gptel-make-gemini "Gemini"
                 :key (getenv "GEMINI_API_KEY")
                 :stream t
                 ))
(setq gptel-log-level 'debug)
(setq gptel-curl-additional-options '("--verbose"))

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

