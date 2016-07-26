;;; kill-compile-window -- Kills compilation window after successful compilation

;;; Commentary:
;;; Code:

(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings"
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not
        (with-current-buffer buffer
          (goto-char (point-min))
          (search-forward "warning" nil t))))
      (run-with-timer 1 nil
                      (lambda (buf)
                        (bury-buffer "*compilation*")
                        (switch-to-prev-buffer (get-buffer-window buf) 'kill)
                        )
                      buffer)))
(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

;;; kill-compile-window.el ends here
