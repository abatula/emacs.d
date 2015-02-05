(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))

;; Mark 80 character colum when working in Python
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))

(require-package 'pip-requirements)

(provide 'init-python-mode)
