;;; startup-el. -- Performs some general configuration on Emacs startup
;;; Commentary:
;;; Code:

(require 'sr-speedbar)

(add-hook 'emacs-startup-hook
          (lambda ()
            (sr-speedbar-open)
            ))

;;; startup.el ends here
