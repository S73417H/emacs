;;; startup-el. -- Performs some general configuration on Emacs startup
;;; Commentary:
;;; Code:

(if (not (package-installed-p 'sr-speedbar))
    (package-install 'sr-speedbar))

(add-hook 'emacs-startup-hook
          (lambda ()
            (sr-speedbar-open)
            ))

;;; startup.el ends here
