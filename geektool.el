;;; geektool.el --- Geektool Specific Emacs File

;;; Commentary:

;;; Code:

(setq org-agenda-files (list "~/Notes/inbox.org"
                             "~/Notes/general.org"
                             "~/Notes/school.org"))
(setq org-agenda-current-time-string "now - - - - - - - - - - - - -")

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
          (org-agenda-prefix-format "%-2T%?-12t% s")))
        ))

(setq org-mobile-agendas 'custom)


(setq org-agenda-time-grid (quote ((daily today require-timed remove-match) "" (0900 1200 1500 1800 2100))))
(setq org-agenda-time-leading-zero t)

;;; geektool.el ends here
