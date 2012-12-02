;;emacs daemon
(server-start)

;;load personal/vendor and it's subdirs
(let ((default-directory "~/.emacs.d/personal/vendor/"))
  (normal-top-level-add-subdirs-to-load-path))

;;load themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/base16")
(load-theme 'base16-custom t)

;;;requires
(require 'org)

(require 'org-crypt)
(require 'epa-file)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'dired-x)

(require 'paredit)

(require 'surround)

(require 'undo-tree)

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
;(require 'prelude-latex)
(require 'prelude-lisp)
(require 'prelude-org)
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

;;midnight mode
(setq midnight-period 7200)

;;focus follows mouse
(setq mouse-autoselect-window t)

;;encryption
(setq epg-gpg-program "gpg2")
(setenv "GPG_AGENT_INFO" "~/.gnupg/gpg-agent.env")
;(setenv "GPG_AGENT_INFO" nil)
;; use keys
(setq epa-file-select-keys nil)
(setq epa-file-inhibit-auto-save t)

;;undo-tree
(global-undo-tree-mode)

;;auctex
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(require 'tex-site)

(setq TeX-PDF-mode nil)
(setq preview-image-type (quote dvipng))
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)

;;my org customizations
;;Don't like the way this works
;;(setq org-startup-indented t)

(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "0AD14C01")

;org-agenda opens in current window
(setq org-agenda-window-setup 'current-window)

;;journal
(defvar org-journal-file "~/Notes/Personal/log.org.gpg"
  "Path to OrgMode journal file.")
(defvar org-journal-date-format "%Y-%m-%d"
  "Date format string for journal headings.")

(defun org-journal-entry ()
  "Create a new diary entry for today or append to an existing one."
  (interactive)
  (switch-to-buffer (find-file org-journal-file))
  (widen)
  (let ((today (format-time-string org-journal-date-format)))
    (beginning-of-buffer)
    (goto-line 3)
    (unless (org-goto-local-search-headings today nil t)
      ((lambda ()
         (org-insert-heading)
         (insert today)
    (beginning-of-buffer)
    (org-show-entry)
    (org-narrow-to-subtree)
    (end-of-buffer)
    (backward-char 2)
    (unless (= (current-column) 2)
      (insert "\n\n  ")))))))

;;capture
(setq org-default-notes-file "~/Notes/inbox.org")
(define-key global-map "\C-cc" 'org-capture)

;;show place in file that I am in agenda...like that makes sense
(setq org-agenda-start-with-follow-mode nil)

;; start agenda from the current day.
(setq org-agenda-start-on-weekday 0)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Notes/")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Notes/inbox.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")

(setq org-agenda-files (list "~/Notes/inbox.org"
                             "~/Notes/general.org"
                             "~/Notes/school.org"))
;; No properties drawer
(setq org-mobile-force-id-on-agenda-items nil)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/@)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

;;time tracking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;;time logging
(setq org-log-done 'time)

;;Evil
(evil-mode 1)
(setq evil-emacs-state-cursor '("#4271ae" box))

(evil-set-initial-state org-agenda-mode-map 'motion)
(evil-set-initial-state dired-mode-map 'motion)
(global-surround-mode 1)
;;(global-define-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
;;(global-define-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;;Prelude-mode
(prelude-global-mode)

;;Only On OS X
(when (eq system-type 'darwin)
    ;;path from zshrc
    (if (not (getenv "TERM_PROGRAM"))
        (setenv "PATH"
                (shell-command-to-string "source $HOME/.zshrc && printf $PATH")))

    ;;Disable Scroll Bars
    (scroll-bar-mode -1)
  )

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

(setq org-agenda-custom-commands
      '(
        ("t" "Today" agenda ""
         ((org-agenda-overriding-header "Today")
          (org-agenda-start-on-weekday nil)
          (org-agenda-span (quote day))
          (org-agenda-show-all-dates nil)
          (org-deadline-warning-days 31)
          (org-agenda-repeating-timestamp-show-all t) ;; ensures that repeating events appear on all relevant dates
            ))
        ("w" "Week" agenda ""
         ((org-agenda-overriding-header "Week")
          (org-agenda-start-on-weekday nil)
          (org-agenda-span (quote week))
          (org-agenda-show-all-dates nil)
          (org-deadline-warning-days 31)
          (org-agenda-repeating-timestamp-show-all t) ;; ensures that repeating events appear on all relevant dates
            ))
        ("m" "Month" agenda ""
         ((org-agenda-overriding-header "Month")
          (org-agenda-start-on-weekday nil)
          (org-agenda-span (quote month))
          (org-agenda-show-all-dates nil)
          (org-deadline-warning-days 31)
          (org-agenda-repeating-timestamp-show-all t) ;; ensures that repeating events appear on all relevant dates
          ))
        ;; limits agenda view to timestamped items
        ("G" "Geektool agenda" agenda ""
         ((org-agenda-ndays 9)
          (org-agenda-show-all-dates t)
          (org-agenda-start-on-weekday nil)
          (org-deadline-warning-days 31)
          (org-agenda-overriding-header "")
          (org-agenda-compact-blocks t)
          (org-agenda-with-colors t)
          (org-agenda-repeating-timestamp-show-all t) ;; ensures that repeating events appear on all relevant dates
          (org-agenda-prefix-format "%-2T%-12:c%?-12t% s"))) ;;"%-2T%?-12t% s"
        ))

(setq org-mobile-agendas 'custom)

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
