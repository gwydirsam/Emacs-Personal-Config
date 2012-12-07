;;; sam-speedbar.el --- Config file for speedbar

;;; Commentary:

;; Taken from https://github.com/rdallasgray/graphene/blob/master/graphene-speedbar.el

;;; Code:

(require 'sr-speedbar)

(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(global-set-key (kbd "s-o") 'sr-speedbar-select-window)
(define-key speedbar-mode-map (kbd "<kp-enter>") 'speedbar-item-rename)
(define-key speedbar-mode-map (kbd "<s-backspace>") 'speedbar-item-delete)
(define-key speedbar-mode-map (kbd "<s-i>") 'speedbar-item-info)
(define-key speedbar-mode-map (kbd "<s-r>") 'speedbar-refresh)

(setq speedbar-hide-button-brackets-flag t
      speedbar-show-unknown-files t
      speedbar-smart-directory-expand-flag t
      speedbar-use-images nil
      speedbar-indentation-width 2
      speedbar-update-flag t
      sr-speedbar-width 20
      sr-speedbar-width-x 20
      sr-speedbar-auto-refresh nil
      sr-speedbar-skip-other-window-p t
      sr-speedbar-right-side nil)

;; More familiar keymap settings.
(add-hook 'speedbar-reconfigure-keymaps-hook
          '(lambda ()
             (define-key speedbar-mode-map [S-up] 'speedbar-up-directory)
             (define-key speedbar-mode-map [right] 'speedbar-flush-expand-line)
             (define-key speedbar-mode-map [left] 'speedbar-contract-line)))

;; Highlight the current line
(add-hook 'speedbar-mode-hook '(lambda () (hl-line-mode 1)))

;; Always use the last selected window for loading files from speedbar.
(defvar last-selected-window (selected-window))
(defadvice select-window (after remember-selected-window activate)
  "Remember the last selected window."
  (unless (eq (selected-window) sr-speedbar-window)
    (setq last-selected-window (selected-window))))

(defun sr-speedbar-before-visiting-file-hook ()
  "Function that hooks `speedbar-before-visiting-file-hook'."
  (select-window last-selected-window))

(defun sr-speedbar-before-visiting-tag-hook ()
  "Function that hooks `speedbar-before-visiting-tag-hook'."
  (select-window last-selected-window))

(defun sr-speedbar-visiting-file-hook ()
  "Function that hooks `speedbar-visiting-file-hook'."
  (select-window last-selected-window))

(defun sr-speedbar-visiting-tag-hook ()
  "Function that hooks `speedbar-visiting-tag-hook'."
  (select-window last-selected-window))

(provide 'sam-speedbar)

;;; sam-speedbar.el ends here
