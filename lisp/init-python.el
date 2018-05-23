(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

;; Mark 80 character colum when working in Python
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; Pep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (add-hook 'python-mode-hook
                (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))

(provide 'init-python)
