;;; sam-org.el --- Org-mode Config

;;; Commentary:

;;; Code:

;;; Org
(require 'org)
(require 'prelude-org)
;(require 'org-fstree)

;; stripe tables
(add-hook 'org-mode-hook 'org-table-stripes-enable)

;org-agenda opens in current window
(setq org-agenda-window-setup 'current-window)

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
                             "~/Notes/schedule.org"
                             "~/Notes/tasks.org"))

;(run-with-idle-timer 60 t 'org-mobile-pull)
;(run-with-idle-timer 70 t 'org-mobile-push)

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

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'org-crypt)
(require 'epa-file)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "0AD14C01")

(setq org-agenda-custom-commands
      '(
        ("g" "Today" agenda ""
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

(provide 'sam-org)

;;; sam-org.el ends here
