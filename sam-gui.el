;;; sam-gui.el --- Emacs Gui Config

;;; Commentary:
;;

;;; Code:

;;; Themes

;; Load theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/base16-emacs")

;; Set theme
(load-theme 'base16-custom t)

;; Enable sRGB
(setq ns-use-srgb-colorspace t)

;; Unicode
;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

;;(require 'unicode-fonts)
;;(unicode-fonts-setup)

;; Set Font
(set-face-attribute 'default nil :family "Consolas for Powerline" :height 200)
;;(set-fontset-font "fontset-default" 'unicode "Consolas for Powerline")

;;; Gui Config

;; Less flickery display
(setq redisplay-dont-pause t)

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

;;Menu-bar-mode
(setq menu-bar-mode t)

;;Enable Tool-bar-mode
;;(tool-bar-mode -1)
;;Fixes Lion Fullscreen
;;(setq tool-bar-lines 0)

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

(provide 'sam-gui)

;;; sam-gui.el ends here
