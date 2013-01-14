;;; sam-editor.el --- General Editing Config

;;; Commentary:
;;

;; Use Smex for recent M-x commands a la ido.
(smex-initialize)

;; Allow commands which would be disabled by default.
(put 'ido-complete 'disabled nil)
(put 'ido-exit-minibuffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'autopair-newline 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;edit mail from mutt in mail mode
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

;;conf-mode for certain files
(add-to-list 'auto-mode-alist '("\\.conf$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\rc$" . conf-mode))
(add-hook 'conf-space-mode-hook (lambda () (sam-prog-mode-defaults)) t)
(add-hook 'conf-colon-mode-hook (lambda () (sam-prog-mode-defaults)) t)
(add-hook 'conf-unix-mode-hook (lambda () (sam-prog-mode-defaults)) t)

;;shell-script-mode for certain files
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-hook 'sh-mode-hook (lambda () (sam-prog-mode-defaults)) t)

;;mark-down
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;gitconfig-mode
(add-to-list 'auto-mode-alist '("\\.gitmodules\\'" . gitconfig-mode))
(add-to-list 'auto-mode-alist '("\\.gitignore\\'" . gitconfig-mode))


;;C-c C-c for mail-mode exit mail
(add-hook 'mail-mode-hook
          (lambda ()
            (define-key mail-mode-map [(control c) (control c)]
              (lambda ()
                (interactive)
                (save-buffer)
                (server-edit)))))


;; Enable flymake for all files
(add-hook 'find-file-hook 'flycheck-mode)

;; fix M-a M-e
(setq sentence-end-double-space nil)

(provide 'sam-editor)

;;; sam-editor.el ends here
