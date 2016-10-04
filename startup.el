;;; startup-el. -- Performs some general configuration on Emacs startup
;;; Commentary:
;;; Code:

(defvar package-list '(sr-speedbar
                       monokai-theme
                       irony
                       company
                       flycheck
                       company-irony
                       flycheck-irony))

(dolist (p package-list)
  (unless (package-installed-p p)
    (package-install p)))

(package-initialize)

(add-hook 'emacs-startup-hook 'sr-speedbar-open)

(load-theme 'monokai)

;; irony / flycheck / company

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-irony))

(setq company-idle-delay 0)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;;; startup.el ends here
