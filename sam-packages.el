;;; Packages
(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; required because of a package.el bug
(setq url-http-attempt-keepalives nil)


(defvar packages
  '(ack-and-a-half
    apache-mode
    applescript-mode
    auctex
    clojure-mode
    coffee-mode
    css-mode
    dired+
    dired-details
    dired-details+
    dired-single
    erlang
    evil
    evil-leader
    evil-numbers
    evil-paredit
    exec-path-from-shell
    expand-region
    feature-mode
    findr
    flymake-css
    flymake-easy
    flymake-haml
    flymake-ruby
    flymake-sass
    font-utils
    gh
    gist
    git-commit-mode
    gitconfig-mode
    gitignore-mode
    gitty
    groovy-mode
    google-c-style
    haml-mode
    haskell-mode
    helm
    helm-projectile
    highlight-parentheses
    htmlize
    inf-ruby
    inflections
    jump
    latex-pretty-symbols
    less-css-mode
    list-utils
    logito
    lua-mode
    magit
    magit-push-remote
    magithub
    markdown-mode
    mediawiki
    melpa
    nrepl
    org
    org-bullets
    paredit
    pcache
    persistent-soft
    php-mode
    powerline
    pretty-mode
    pretty-symbols-mode
    projectile
    python
    rainbow-delimiters
    rainbow-mode
    rinari
    ruby-block
    ruby-compilation
    ruby-electric
    ruby-end
    ruby-interpolation
    ruby-mode
    ruby-tools
    rvm
    s
    sass-mode
    scala-mode
    scss-mode
    smooth-scrolling
    sr-speedbar
    string-utils
    textile-mode
    ucs-utils
    undo-tree
    unicode-whitespace
    volatile-highlights
    writegood-mode
    yari
    yasnippet
    yaml-mode
    evil-paredit)
  "A list of packages to ensure are installed at launch.")

(defun fully-installed-p ()
  (loop for p in packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun install-packages ()
  (unless (fully-installed-p)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    (dolist (p packages)
      (unless (package-installed-p p)
        (package-install p)))))

(install-packages)

(provide 'sam-packages)
