;;; GPG

;;encryption
(setq epg-gpg-program "gpg2")
(setenv "GPG_AGENT_INFO" "~/.gnupg/gpg-agent.env")
;(setenv "GPG_AGENT_INFO" nil)
;; use keys
(setq epa-file-select-keys nil)
(setq epa-file-inhibit-auto-save t)
