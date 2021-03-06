(setf inhibit-startup-screen t) ; disable welcome screen

(setf ring-bell-function 'ignore) ; disable alarm bell

(when (not (display-graphic-p))
  (menu-bar-mode -1)) ; disable menu bar in CLI

;; improve scrolling
(setf scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

(show-paren-mode 1) ; highlight matching parens

(global-hl-line-mode 1) ; highlight current line

(setq-default indent-tabs-mode nil) ; use spaces instead of tabs

(xterm-mouse-mode 1) ; enable mouse support in terminal

(setq tab-always-indent 'complete) ; make tab complete as well as indent

(setq ns-pop-up-frames nil) ; open files in existing frame

;; store all backup and autosave files outside the working directory,
;; in the temporary-file-directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq ispell-program-name "aspell")

(electric-indent-mode +1)

;; Eglot

(defvar oj-default-pyright "/Users/oj244/mambaforge/envs/p39/bin/pyright"
  "define a default pyls to be used")

(defun oj/python-eglot-enable ()
  "set variables and hook for eglot python IDE"
  (interactive)
  (setq company-backends
        (cons 'company-capf
              (remove 'company-capf company-backends)))
  (add-to-list 'eglot-server-programs
               `(python-mode ,oj-default-pyright))
  (add-hook 'python-mode-hook 'eglot-ensure))

(defun oj/python-eglot-disable ()
  "remove hook for eglot python"
  (interactive)
  (remove-hook 'python-mode-hook 'eglot-ensure))

