;;; Evil
;; evil requires undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

(require 'evil)
(require 'evil-leader)
(evil-mode 1)
(setq evil-emacs-state-cursor '("#4271ae" box))

(evil-set-initial-state org-agenda-mode-map 'motion)
(evil-set-initial-state dired-mode-map 'motion)

(require 'surround)
(global-surround-mode 1)

(require 'evil-numbers)
(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

(require 'paredit)
(require 'evil-paredit)
