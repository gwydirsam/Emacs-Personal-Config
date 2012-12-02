;;; OS X
;; Set Path
(when (eq system-type 'darwin)
  ;;path from zshrc
  (if (not (getenv "TERM_PROGRAM"))
      (setenv "PATH"
              (shell-command-to-string "source $HOME/.zshrc && printf $PATH"))))
