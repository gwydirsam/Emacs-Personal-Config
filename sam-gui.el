;;; Themes

;; Load theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/base16")

;; Set theme
(load-theme 'base16-custom t)

;;; Gui Config

;; speedbar
(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)

;;no scroll bars
(defun setup-frame-hook (new-frame)
  "This function will be applied to all new emacs frames."
  (select-frame new-frame)
  (scroll-bar-mode 0))                   ; no scrollbar
(add-hook 'after-make-frame-functions 'setup-frame-hook)

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

;;; Shut up compile saves
(setq compilation-ask-about-save nil)

; make completion buffers disappear after 3 seconds.
(add-hook 'completion-setup-hook
          (lambda () (run-at-time 3 nil
                                  (lambda () (delete-windows-on "*Completions*"))
                                  (lambda () (delete-windows-on "*Ido Completions*")))))
