;;; init-local --- My custom edits
;;; Commentary:

;;; Code:
;;; Please stop with the nagging question marks on the side

(delete-selection-mode 1) ;; Overwrite/delete selected text

;;; Use ergoemacs mode for standard keybindings;(package-initialize)
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assume QWERTY
(ergoemacs-mode 1)

;;; Changing shortcuts
;(global-set-key (kbd "C-c") 'clipboard-kill-ring-save) ;; Ctrl+c copy: This will probably cause problems with the many C-c C-<something> commands that I don't use anyway
;(global-set-key (kbd "C-x") 'clipboard-kill-region) ;; Ctrl+x cut
;(global-set-key (kbd "C-v") 'clipboard-yank) ;; Ctrl+v paste
;(global-set-key (kbd "C-o") 'find-file) ;; Ctrl+o open
;(global-set-key (kbd "C-f") 'search) ;; Ctrl+f find
;(global-set-key (kbd "C-s") 'save-buffer) ;; Ctrl+s save

(provide 'init-local)
;;; init-local.el ends here
