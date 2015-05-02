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
(require 'linum)
(global-linum-mode t)

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

;; Change cursor to a bar
(setq-default cursor-type 'bar)

(provide 'init-local)
;;; init-local.el ends here
