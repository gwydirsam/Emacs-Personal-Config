;;emacs daemon
(server-start)

;;load personal/vendor and it's subdirs
(let ((default-directory "~/.emacs.d/personal/vendor/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'dired-x)

;;midnight mode
(setq midnight-period 7200)

;;focus follows mouse
(setq mouse-autoselect-window t)

;;Disable Scroll Bars
(scroll-bar-mode -1)

;;Disable fringe-mode
(set-fringe-mode 0)

;;visual line mode
(visual-line-mode 1)

;;line-spacing
(setq line-spacing 3)

;;selection modification
;; make the current 'selection' visible
(transient-mark-mode t)

;;winner-mode
(winner-mode 1)

(blink-cursor-mode t)
;;(global-linum-mode t)
;;(global-hl-line-mode t)

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

;;hide hidden files in dired
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

;;C-c C-c for mail-mode exit mail
(add-hook 'mail-mode-hook
          (lambda ()
            (define-key mail-mode-map [(control c) (control c)]
              (lambda ()
                (interactive)
                (save-buffer)
                (server-edit)))))

;;no scroll bars
(defun setup-frame-hook (new-frame)
  "This function will be applied to all new emacs frames."
  (select-frame new-frame)
  (scroll-bar-mode 0))                   ; no scrollbar
(add-hook 'after-make-frame-functions 'setup-frame-hook)

; make completion buffers disappear after 3 seconds.
(add-hook 'completion-setup-hook
          (lambda () (run-at-time 3 nil
                                  (lambda () (delete-windows-on "*Completions*"))
                                  (lambda () (delete-windows-on "*Ido Completions*")))))

;;; Shut up compile saves
(setq compilation-ask-about-save nil)
;;; Don't save *anything*
(setq compilation-save-buffers-predicate '(lambda () nil))

;; fix M-a M-e
(setq sentence-end-double-space nil)

;; dired-details
(dired-details-install)
