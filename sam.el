;;; sam.el --- General Config

;;; Commentary:

;;; Code:

;;load personal/vendor and it's subdirs
(let ((default-directory "~/.emacs.d/personal/vendor/"))
  (normal-top-level-add-subdirs-to-load-path))

;;midnight mode
(setq midnight-period 7200)

;;; Don't save *anything*
(setq compilation-save-buffers-predicate '(lambda () nil))


(provide 'sam)

;;; sam.el ends here
