;;; init-local --- My custom edits
;;; Commentary:

;;; Code:
;;; Please stop with the nagging question marks on the side

;;; Set up ergoemacs-mode
(require 'ergoemacs-mode)
(package-initialize)
(setq ergoemacs-theme nil) ;; Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assume QWERTY
(ergoemacs-mode 1)

(delete-selection-mode 1) ;; Overwrite/delete selected text

;; Display line numbers
;; Intelligently increase line number size on font increase
;; https://stackoverflow.com/questions/9304192/emacs-linum-mode-and-size-of-font-unreadable-line-numbers

(require 'linum)
(defun linum-update-window-scale-fix (win)
  "fix linum for scaled text"
  (set-window-margins win
                      (ceiling (* (if (boundp 'text-scale-mode-step)
                                      (expt text-scale-mode-step
                                            text-scale-mode-amount) 1)
                                  (if (car (window-margins))
                                      (car (window-margins)) 1)
                                  ))))
(advice-add #'linum-update-window :after #'linum-update-window-scale-fix)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; Intelligent commenting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Intelligent line/region comments
(defun comment-or-uncomment-region-or-line()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (progn
          (setq beg (region-beginning) end (region-end))
          (save-excursion
            (setq beg (progn (goto-char beg) (line-beginning-position))
                  end (progn (goto-char end) (line-end-position)))))
      (setq beg (line-beginning-position)
            end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))

;; Bind intelligent comment section to Ctrl-d
(global-set-key (kbd "C-d") 'comment-or-uncomment-region-or-line)

;; PDF latex
(require 'tex)
(TeX-global-PDF-mode t)

;; ESS for R
(require 'ess-site)

;; Change cursor to a bar
(setq-default cursor-type 'bar)

(provide 'init-local)
;;; init-local.el ends here
