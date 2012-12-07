;;; sam-osx.el --- OS X Specific Config

;;; Commentary:

;;; Code:

(when (eq system-type 'darwin)

  ;; Set Path
  (if (not (getenv "TERM_PROGRAM"))
      (setenv "PATH"
              (shell-command-to-string "source $HOME/.zshrc && printf $PATH")))
)

(provide 'sam-osx)

;;; sam-osx.el ends here
