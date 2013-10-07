;;; sam-evil.el --- Evil, the vim emulator, Config

;;; Commentary:
;;

;;; Code:

(require 'evil)
(require 'surround)

(evil-mode 1)
(global-surround-mode 1)

(setq evil-normal-state-cursor '("#ac4142" box))
(setq evil-emacs-state-cursor '("#6a9fb5" box))

;; coflicts with evil
(key-chord-mode -1)

;;(evil-set-initial-state org-agenda-mode-map 'motion)
;;(evil-set-initial-state dired-mode-map 'motion)

(provide 'sam-evil)

;;; sam-evil.el ends here
