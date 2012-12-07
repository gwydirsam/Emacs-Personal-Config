;;; sam-tex.el --- AucTex/LaTeX config

;;; Code:

;;; Commentary:

;; I think this breaks inline images
;(require 'prelude-latex)

;;auctex
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(require 'tex-site)

(setq TeX-PDF-mode nil)
(setq preview-image-type (quote dvipng))
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)

(provide 'sam-tex)

;;; sam-tex.el ends here
