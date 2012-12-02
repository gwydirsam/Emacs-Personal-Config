;;; My Keyboard Bindings

;;; Code:

;; Kill-buffer
(global-set-key (kbd "s-k") 'kill-this-buffer)

;;;; Paste
;;(global-set-key (kbd "s-v") 'clipboard-yank)
;;
;;;; Copy
;;(global-set-key (kbd "s-v") 'clipboard-kill-ring-save)

;; Quit
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
