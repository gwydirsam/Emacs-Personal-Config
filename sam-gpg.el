;;; sam-gpg.el --- GPG Config

;;; Commentary:
;;

;;; Code:

(require 'epa-file)
(epa-file-enable)

;;encryption
(setq epg-gpg-program "/usr/local/bin/gpg")
;;(setenv "GPG_AGENT_INFO" (shell-command-to-string "echo `echo $TMPDIR`/gpg-agent.env"  ))
;; use keys
(setq epa-file-select-keys nil)
(setq epa-file-inhibit-auto-save t)

(provide 'sam-gpg)

;;; sam-gpg.el ends here
