;; (package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages (quote (solarized-theme persistent-soft ergoemacs-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Add lisp directory to the load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Install required packages, if not already
(require 'init-packages)
(package-initialize)

;; ErgoEmacs
(require 'ergoemacs-mode)

;;---------------------------------------------
;; Customize display
;;---------------------------------------------

;; Use solarized theme
(load-theme 'solarized-dark)

;; Display line numbers
;; Intelligently increase line number size on font increase
;; https://stackoverflow.com/questions/9304192/emacs-linum-mode-and-size-of-font-unreadable-line-numbers

(require 'linum)
(defun linum-update-window-scale-fix (win)
  "Fix linum for scaled text."
  (set-window-margins win
                      (ceiling (* (if (boundp 'text-scale-mode-step)
                                      (expt text-scale-mode-step
                                            text-scale-mode-amount) 1)
                                  (if (car (window-margins))
                                      (car (window-margins)) 1)
                                  ))))
(advice-add #'linum-update-window :after #'linum-update-window-scale-fix)
(global-linum-mode 1)

;; Change cursor to a bar
(setq-default cursor-type 'bar)

;;---------------------------------------------
;; Custom keybindings
;;---------------------------------------------

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


;;---------------------------------------------
;; Load configs for specific features/modes
;;---------------------------------------------

(require 'init-python)
