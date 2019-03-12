;; Associate .py files with python-mode
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; Mark 80 character colum when working in Python
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; Pep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-python)
