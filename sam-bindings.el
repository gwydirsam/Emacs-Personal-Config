;;; sam-bindings.el --- My Keyboard Bindings

;;; Commentary:
;;

;;; Code:

;; map hyper to function
(setq ns-function-modifier 'hyper)
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

;; Kill-buffer
(global-set-key [remap prelude-kill-whole-line] 'kill-this-buffer)

;;;These were for Emacs-Mac-Port, but messes up normal emacs
;;;; Paste
;;(global-set-key (kbd "s-v") 'clipboard-yank)
;;
;;;; Copy
;;(global-set-key (kbd "s-v") 'clipboard-kill-ring-save)

;; Quit
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)

;; Smex
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-x M-x") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Evil
(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

(provide 'sam-bindings)

;;; sam-bindings.el ends here
