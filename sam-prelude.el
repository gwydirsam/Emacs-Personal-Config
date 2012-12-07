;;; sam-prelude.el --- Emacs Prelude Config

;;; Commentary:
;;

;;prelude-modules
(require 'prelude-c)
(require 'prelude-clojure)
(require 'prelude-coffee)
(require 'prelude-common-lisp)
(require 'prelude-css)
(require 'prelude-emacs-lisp)
(require 'prelude-programming)
(require 'prelude-haskell)
(require 'prelude-js)
(require 'prelude-erlang)
(require 'prelude-lisp)
(require 'prelude-perl)
(require 'prelude-python)
(require 'prelude-ruby)
(require 'prelude-scala)
(require 'prelude-scheme)
(require 'prelude-scss)
(require 'prelude-xml)
;; tools & utilities support
(require 'prelude-erc)
(require 'prelude-mediawiki)

;;Prelude-mode
;;; Code:

(prelude-global-mode)

;;Prog Mode Hooks
(defun sam-prog-mode-defaults ()
  "My coding hooks"
  (flyspell-prog-mode)
  (prelude-local-comment-auto-fill)
  (whitespace-turn-off)
  (prelude-add-watchwords)
  (linum-mode)
  (visual-line-mode 0))
(add-hook 'prelude-prog-mode-hook 'sam-prog-mode-defaults t)

;;ruby mode uses prog-mode-defaults
(add-hook 'prelude-ruby-mode-hook 'sam-prog-mode-defaults t)

(provide 'sam-prelude)

;;; sam-prelude.el ends here
