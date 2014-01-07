(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)

(setq url-proxy-services
      '(("http" . "13.147.7.31:8000")
        ("https" . "13.147.7.31:8000")))

(push "/usr/local/bin" exec-path)
(add-to-list 'load-path "~/.emacs.d")

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default
 tab-width 2
 indent-tabs-mode nil)

(setq
 auto-save-default nil
 byte-compile-verbose nil
 byte-compile-warnings nil
 confirm-kill-emacs 'yes-or-no-p
 dabbrev-abbrev-skip-leading-regexp "\\$"
 dired-recursive-copies 'always
 dired-recursive-deletes 'always
 display-time-day-and-date t
 fill-column 128
 font-lock-maximum-decoration t
 global-subword-mode 1
 grep-command "grep -rin"
 hippie-expand-dabbrev-as-symbol nil
 ido-enable-flex-matching t
 inhibit-splash-screen t
 inhibit-startup-message t
 make-backup-files nil
 next-line-add-newlines nil
 plsql-indent 4
 require-final-newline nil
 nrepl-hide-special-buffers t
 truncate-partial-width-windows nil
 x-select-enable-clipboard t
 x-select-enable-primary t
 save-interprogram-paste-before-kill t
 apropos-do-all t
 mouse-yank-at-point t)

(blink-cursor-mode t)
(column-number-mode t)
(delete-selection-mode t)
(global-font-lock-mode t)
(icomplete-mode t)
(ido-mode t)
(line-number-mode t)
(scroll-bar-mode -1)
(set-fringe-style -1)
(show-paren-mode t)
(toggle-truncate-lines -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(transient-mark-mode t)
(desktop-save-mode t)

;; Highlight trailing whitespace in a hideous red color.
(add-hook 'find-file-hook
          (lambda ()
            "Highlight trailing whitespace in a hideous red color"
            (progn
              (show-paren-mode 1)
              (setq indicate-empty-lines t
                    show-trailing-whitespace t))))

; Always delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation)
                               (define-key ruby-mode-map (kbd "<f5>") 'rspec-toggle-spec-and-target)
                               (define-key ruby-mode-map (kbd "<f6>") 'rspec-verify-all)
                               (define-key ruby-mode-map (kbd "<f7>") 'rspec-verify))))

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

(global-set-key (kbd "C-x v") 'switch-to-buffer)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c r") 'query-replace-regexp)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; (setq cider-popup-stacktraces nil)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'cider-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'solarized-dark)