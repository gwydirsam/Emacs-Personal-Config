;;; Dired
(require 'dired-x)

;;hide hidden files in dired
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

;; dired-details
(require 'dired-details)
(dired-details-install)
