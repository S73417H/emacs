;;; startup-el. -- Performs some general configuration on Emacs startup
;;; Commentary:
;;; Code:

(if (not (package-installed-p 'sr-speedbar))
    (package-install 'sr-speedbar))

(if (not (package-installed-p 'monokai-theme))
    (package-install 'monokai-theme))

(add-hook 'emacs-startup-hook
          (lambda ()
            (sr-speedbar-open)
            ))

(load-theme 'monokai)

;;; startup.el ends here
