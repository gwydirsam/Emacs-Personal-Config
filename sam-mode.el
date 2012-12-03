;;; Auto Modes

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

;;C-c C-c for mail-mode exit mail
(add-hook 'mail-mode-hook
          (lambda ()
            (define-key mail-mode-map [(control c) (control c)]
              (lambda ()
                (interactive)
                (save-buffer)
                (server-edit)))))
