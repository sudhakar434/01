;;; init.el --- Emacs Config
;;

;;; Code:

(require 'cl)
(require 'package)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basic config

;; load custom variables
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; dont truncate log messages
(setq message-log-max t)

;; set package-user-dir to be relative to ~/.emacs.d/
(defvar root-dir (file-name-directory load-file-name)
  "The root dir of the Emacs")
(setq package-user-dir (expand-file-name "elpa" root-dir))
(setq package-vendor-dir (expand-file-name "vendor" root-dir))
(setq recent-files-dir (expand-file-name "recentf" root-dir))

;; load secret variables
(load-file "~/Dropbox/tech/private.el")

;; Always load newest byte code
;; (setq load-prefer-newer t)

;; turn on debug
;; (toggle-debug-on-error)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; dont prompt while creating new buffer
(setq confirm-nonexistent-file-or-buffer nil)

;; kill process buffer without confirmation
(setq kill-buffer-query-functions
      (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

;; confirm before killing emacs
;; (setq confirm-kill-emacs
;;       (lambda (&rest _)
;;         (message "Quit in 3 sec (`C-g' or other action cancels)")
;;         (sit-for 3)))


;; always split vertically
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)


;; always kill line with whitespace
;; (setq kill-whole-line t)

(setq max-lisp-eval-depth 10000)
(setq max-specpdl-size 32000)

;; enable auto copy
(setq x-select-enable-primary t)
(setq x-select-enable-clipboard t)
;; (setq mouse-drag-copy-region t)



;; (setq temporary-file-directory "/tmp")
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ui config

;; maximize on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; remove scroll bar
(scroll-bar-mode -1)

;; disable tool bar
(tool-bar-mode -1)

;; disable menu bar
(menu-bar-mode -1)

;; disable blinking
(blink-cursor-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; set fond & colors
(set-default-font "Ubuntu Mono 13")
(set-background-color "#f1f1f1")
(add-to-list 'default-frame-alist '(background-color . "#f1f1f1"))

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)

;; show size in mode line
;; (size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; set frame title
(setq frame-title-format
      '("" invocation-name
        " Avil Page - "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages


;; save recent files
(require 'recentf)
(setq
 ;; recentf-save-file (expand-file-name "recentf" recent-files-dir)
 recentf-max-saved-items 500
 recentf-max-menu-items 15
 ;; disable recentf-cleanup on Emacs start, because it can cause
 ;; problems with remote files
 recentf-auto-cleanup 'never)
(recentf-mode +1)
(run-at-time nil (* 5 60) 'recentf-save-list)
(run-with-idle-timer 5  nil 'recentf-cleanup)


;; save cursor positions
(save-place-mode 1)


;;Automatically save and restore sessions
;; (require 'desktop)
;; (setq desktop-dirname             "~/.emacs.d/desktop/"
;;       desktop-base-file-name      "emacs.desktop"
;;       desktop-base-lock-name      "lock"
;;       desktop-path                (list desktop-dirname)
;;       desktop-save                t
;;       desktop-files-not-to-save   "^$"  ;reload tramp paths
;;       desktop-load-locked-desktop nil)
;; (desktop-save-mode 1)


;; (defun my-desktop ()
;;   "Load the desktop and enable autosaving"
;;   (interactive)
;;   (let ((desktop-load-locked-desktop "ask"))
;;     (desktop-read)
;;     (desktop-save-mode 1)))


;; save history
;; (psession-mode 1)
(savehist-mode 1)
(setq history-length 1000)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
;; (setq savehist-file "~/.emacs.d/savehist")


;; enable semantic mode
(semantic-mode 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Third party packages

;; add melpa to archives
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; (package-refresh-contents)
;; (package-initialize)

;; dont check signatures
(setq package-check-signature nil)


;; install use package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)



;; general packages


;; dired config
(require 'dired)
(use-package dired+)
(use-package dired-details+)

(setq dired-recursive-deletes 'always
      dired-recursive-copies 'always
      delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs"
      dired-no-confirm t
      dired-dwim-target t
      dired-deletion-confirmer '(lambda (x) t)
      dired-details-hide-link-targets nil)

(setq-default dired-omit-mode t)
(setq-default dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.")

;; auto revert dired buffers
(add-hook 'dired-mode-hook 'auto-revert-mode)
(define-key dired-mode-map "u" 'dired-up-directory)
(define-key dired-mode-map (kbd "C-o") 'dired-omit-mode)

(diredp-toggle-find-file-reuse-dir 1)

;; unzip zipped file dired
(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
                '("\\.zip\\'" ".zip" "unzip")))

;;(add-to-list 'dired-omit-extension ".example")
;;(add-to-list 'dired-omit-extension ".pyc")



;; navigation

(use-package goto-last-change
  :config
  (global-set-key (kbd "M-m") 'goto-last-change))


;; (use-package golden-ratio
;;   :config
;;   (golden-ratio-mode 1)

;;   (defvar golden-ratio-selected-window
;;     (frame-selected-window)
;;     "Selected window.")

;;   (defun golden-ratio-set-selected-window
;;       (&optional window)
;;     "Set selected window to WINDOW."
;;     (setq-default
;;      golden-ratio-selected-window (or window (frame-selected-window))))

;;   (defun golden-ratio-selected-window-p
;;       (&optional window)
;;     "Return t if WINDOW is selected window."
;;     (eq (or window (selected-window))
;;         (default-value 'golden-ratio-selected-window)))

;;   (defun golden-ratio-maybe
;;       (&optional arg)
;;     "Run `golden-ratio' if `golden-ratio-selected-window-p' returns nil."
;;     (interactive "p")
;;     (unless (golden-ratio-selected-window-p)
;;       (golden-ratio-set-selected-window)
;;       (golden-ratio arg)))

;;   (add-hook 'buffer-list-update-hook #'golden-ratio-maybe)
;;   (add-hook 'focus-in-hook           #'golden-ratio)
;;   (add-hook 'focus-out-hook          #'golden-ratio))


(use-package windmove
  :config
  (windmove-default-keybindings))

(use-package ace-window
  :config
  (global-set-key (kbd "M-p") 'ace-window)
  (setq aw-keys '(?d ?f ?g ?h ?j ?k)))


;; (use-package neotree
;;   :config
;;   (global-set-key [f8] 'neotree-toggle))

(use-package dired-subtree
  :config
  (define-key dired-mode-map "i" 'dired-subtree-insert)
  (define-key dired-mode-map ";" 'dired-subtree-remove))


(use-package direx
  :config
  (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory))


;; (use-package dirtree
;;   :config
;;   (use-package tree-mode)
;;   (use-package windata)

;;   (defun neotree-current ()
;;     (interactive)
;;     (neotree-dir default-directory))

;;   (global-set-key [f8] #'neotree-current))



;; programming mode packages

(use-package focus)


(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-cache-file (expand-file-name  ".projectile.cache" root-dir))
  ;; (projectile-ignore-global ".DS_Store" ".gitmodules" ".gitignore")
  ;; (setq projectile-ignored-files (append projectile-ignored-files '("node_modules" "bower_components")))
  ;; (setq projectile-indexing-method 'native)
  )


(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


(use-package vimish-fold
  :config
  (vimish-fold-global-mode-enable-in-buffers)
  (add-hook 'markdown-mode-hook #'vimish-fold-mode))




(use-package real-auto-save
  :config
  (add-hook 'prog-mode-hook 'real-auto-save-mode)
  (setq real-auto-save-interval 10))

(use-package yasnippet
  :config
  (yas-global-mode 1))


;; (use-package paredit)

(use-package smartparens
  :config
  (sp-pair "`" "`" :wrap "C-`")
  (sp-pair "%" "%" :wrap "C-%")
  (sp-pair "<" ">" :wrap "C->")
  (defun strict-smartparens ()
    (turn-on-smartparens-strict-mode))
  (add-hook 'prog-mode-hook 'strict-smartparens))

(use-package electric-operator
  :config
  (add-hook 'python-mode-hook #'electric-operator-mode))




;; python mode

(use-package pyvenv)
(use-package highlight-indentation)
(use-package company
  :config
  (global-company-mode 1)

  (setq company-idle-delay 0)
  (setq company-tooltip-limit 5)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-flip-when-above t)

  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; (use-package elpy)
(add-to-list 'load-path "~/projects/python/elpy")
(load "elpy" nil t)
(elpy-enable)

(append grep-find-ignored-files "flycheck_*")

(setq python-shell-prompt-detect-failure-warning nil)
(setq python-shell-completion-native-enable nil)
(setq python-indent-offset 4)
(setq python-indent-guess-indent-offset nil)

(setq elpy-test-runner 'elpy-test-pytest-runner)
(setq elpy-rpc-timeout nil)
(setq elpy-rgrep-file-pattern "*.py *.html")
(setq elpy-rpc-backend "jedi")
;; (setq elpy-rpc-python-command "python3.5")
(setq elpy-rpc-python-command "python3")
;; (elpy-use-ipython)

(defun elpy-install-requirements ()
  (interactive)
  (async-shell-command "sudo pip install rope jedi flake8 importmagic autopep8 yapf --upgrade"))

(require 's)

(defun elpy-goto-definition-or-template ()
  (interactive)
  (if (inside-string)
      (elpy-goto-template)
    (elpy-goto-definition)))

(defun elpy-goto-template ()
  (interactive)
  (let ((file-name (thing-at-point 'filename)))
    (find-file (expand-file-name
                (dolist (f (projectile-current-project-files))
                  (if (s-contains? file-name f)
                      (return f)))
                (projectile-project-root)))))


;; activate exp
(pyvenv-workon "p35")
(elpy-rpc-restart)

(defun my/send-region-or-buffer (&optional arg)
  (interactive "P")
  (elpy-shell-send-region-or-buffer arg)
  (with-current-buffer (process-buffer (elpy-shell-get-or-create-process))
    (set-window-point (get-buffer-window (current-buffer))
                      (point-max))))

(define-key elpy-mode-map (kbd "C-c C-c") 'my/send-region-or-buffer)
(define-key elpy-mode-map (kbd "<return>") 'elpy-open-and-indent-line-below)
(define-key elpy-mode-map (kbd "M-,") 'pop-tag-mark)

(defun company-yasnippet-or-completion ()
  "Solve company yasnippet conflicts."
  (interactive)
  (let ((yas-fallback-behavior
         (apply 'company-complete-common nil)))
    (yas-expand)))

(add-hook 'company-mode-hook
          (lambda ()
            (substitute-key-definition
             'company-complete-common
             'company-yasnippet-or-completion
             company-active-map)))

;; (use-package pony-mode)

(use-package wrap-region)


(use-package circe
  :config
  (setq circe-reduce-lurker-spam t)
  (setq circe-network-options
       `(("Freenode"
           :host "irc.freenode.net"
           :port (6667 . 6697)
           :nick "chillaranand"
           :channels (:after-auth
                      "#python", "#python-india", "#python-dev", "#django", "#django-dev"
                      "#emacs", "#emacs-india" "#emacs-elpy")
           :nickserv-password ,irc-password
           )))
  (define-key circe-channel-mode-map (kbd "C-c C-n") 'tracking-next-buffer))


(use-package bash-completion
  :config
  (bash-completion-setup))


(use-package multi-term

  :config
  (defun mutli-term-get-or-create-process ()
    (interactive)
    (let* ((bufname "*terminal<1>*")
           (proc (get-buffer-process bufname)))
      (when (not proc)
        (multi-term))
      (display-buffer bufname
                  nil
                  'visible)))
  :bind
  ("C-c C-t" . multi-term-get-or-create-process))


(use-package xterm-color)


(defun sh-send-line-or-region (&optional step)
  (interactive ())
  (setq process-name "*terminal<1>*")
  (let ((proc (get-process process-name))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (shell)
        (switch-to-buffer currbuff)
        (setq proc (get-process process-name))
        ))
    (setq pbuff (process-buffer proc))
    (if (use-region-p)
        (setq min (region-beginning)
              max (region-end))
      (setq min (point-at-bol)
            max (point-at-eol)))
    (setq command (concat (buffer-substring min max) "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point))
      ) ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step
      (goto-char max)
      (next-line))
    ))

(defun sh-send-line-or-region-and-step ()
  (interactive)
  (sh-send-line-or-region t))

(defun sh-switch-to-process-buffer ()
  (interactive)
  (pop-to-buffer (process-buffer (get-process "shell")) t))

(require 'sh-script)
(sh-set-shell "zsh")
(add-hook 'shell-mode-hook
          'ansi-color-for-comint-mode-on)
(define-key sh-mode-map (kbd "C-c C-c") 'sh-send-line-or-region-and-step)
(define-key sh-mode-map (kbd "C-c C-z") 'sh-switch-to-process-buffer)


(use-package prodigy
  :config

  (prodigy-define-service
    :name "0 django sherlock"
    :tags '(appknox)
    :cwd "~/projects/appknox/sherlock/"
    :command "bash"
    :args '("scripts/start_server.sh")
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)

  (prodigy-define-service
    :name "1 sherlock celery"
    :tags '(appknox)
    :init (lambda () (pyvenv-workon "sherlock"))
    :cwd "~/projects/appknox/sherlock/"
    :command "bash"
    :args '("scripts/start_celery.sh")
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)

  (prodigy-define-service
    :name "irene ember serve"
    :tags '(appknox)
    :cwd "~/projects/appknox/irene/"
    :command "bash"
    :args '("scripts/start_server.sh")
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)

  (prodigy-define-service
    :name "avilpage serve"
    :cwd "~/projects/python/avilpage/"
    :command "nikola"
    :args '("auto")
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)

  :bind
  ("C-x C-p" . prodigy))

(defun prodigy-begin ()
  (interactive)
  (prodigy)
  (with-current-buffer "*prodigy*"
    (prodigy-mark-all)
    (prodigy-start)
    (prodigy-unmark-all)))


(use-package salt-mode)


(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-c m e") 'mc/edit-lines)
  (global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this))




(use-package header2)


(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tmpl?\\'" . web-mode))
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))

  (setq-default indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-js-indent-offset 4)
  (setq web-mode-enable-current-element-highlight t)

  (setq web-mode-script-padding 0)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-auto-pairing nil)

  (set (make-local-variable 'company-backends) '(company-css))

  (bind-key "C-c C-i" 'web-mode-buffer-indent)
  (bind-key "C-c C-l" 'web-mode-fold-or-unfold))



(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))


(use-package ember-mode
  :config
  (add-hook 'js-mode-hook (lambda () (ember-mode t)))
  (add-hook 'web-mode-hook (lambda () (ember-mode t))))


(use-package slim-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.emblem\\'" . slim-mode)))


(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1))


(use-package nyan-mode
  :config
  (nyan-mode))


;; (use-package ctags-update)


(use-package pointback)

(use-package magit
  :config

  (defun my-magit-status ()
    "Don't split window."
    (interactive)
    (let ((pop-up-windows nil))
      (call-interactively 'magit-status)
      (magit-section-forward-sibling)
      (magit-section-forward)))

  ;; hide async shell command output buffers
  ;; (add-to-list 'display-buffer-alist (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

  (defun git-sync ()
    (interactive)
    (message "Syncing repo...")
    (async-shell-command "git pull && git push")
    (magit-refresh))

  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  (setq magit-last-seen-setup-instructions "1.4.0")
  (global-git-commit-mode)

  (bind-key "C-c C-s" 'git-sync)
  (define-key magit-mode-map (kbd "M-p") nil))
;;   :config
;;   (global-git-gutter-mode +1))

(use-package magit-gh-pulls
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls))


(use-package diff-hl
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode)
  (diff-hl-dired-mode))


(use-package sx
  :config
  (require 'sx-load))


(use-package edit-server
  :init
  (when (require 'edit-server nil t)
    (setq edit-server-new-frame nil)
    (edit-server-start)))


;; (use-package multi-term
;;   :config
;;   (setq multi-term-program "/bin/zsh")
;;   (bind-key "C-c C-t" 'multi-term)
;;   (bind-key "C-c C-n" 'multi-term-next)
;;   (bind-key "C-c C-p" 'multi-term-prev))


(use-package free-keys)


(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (setq rm-whitelist "elpy")
  (sml/setup)
  (sml/apply-theme 'light))

;; (setq mode-line-format
;;       '("%e" mode-line-front-space mode-line-mule-info mode-line-client
;;         mode-line-modified mode-line-remote mode-line-frame-identification
;;         mode-line-buffer-identification
;;         (vc-mode vc-mode)
;;         sml/pre-modes-separator mode-line-modes
;;         sml/pos-id-separator mode-line-position))

(use-package impatient-mode)


(use-package highlight-symbol
  :init
  (progn
    (global-set-key [f3] 'highlight-symbol-next)
    (global-set-key [(shift f3)] 'highlight-symbol-prev)
    (global-set-key [(control f3)] 'highlight-symbol)
    (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
    (highlight-symbol-mode 1)
    (highlight-symbol-nav-mode 1)))


(use-package comment-dwim-2
  :init
  (global-set-key (kbd "M-;") 'comment-dwim-2))


(use-package openwith
  :init
  (openwith-mode t)
  (setq large-file-warning-threshold 500000000)
  (setq openwith-associations
        (list (list (openwith-make-extension-regexp '("pdf"))
                    "evince" '(file))
              (list (openwith-make-extension-regexp '("flac" "mp3" "wav" "webm" "mp4"))
                    "vlc" '(file))
              (list (openwith-make-extension-regexp
                     '("avi" "flv" "mov" "mp4" "mkv" "mpeg" "mpg" "ogg" "wmv"))
                    "vlc" '(file))
              (list (openwith-make-extension-regexp '("bmp" "jpeg" "jpg" "png"))
                    "ristretto" '(file))
              (list (openwith-make-extension-regexp '("doc" "docx" "odt"))
                    "libreoffice" '("--writer" file))
              (list (openwith-make-extension-regexp '("ods" "xls" "xlsx"))
                    "libreoffice" '("--calc" file))
              (list (openwith-make-extension-regexp '("odp" "pps" "ppt" "pptx"))
                    "libreoffice" '("--impress" file))
              )))


(use-package easy-kill
  :config
  (bind-key "M-w" 'easy-kill))

(use-package paren
  :config
  (setq show-paren-style 'parenthesis)
  (show-paren-mode +1))

(use-package helm-chrome)
(use-package helm-descbinds)
(use-package helm-projectile)
(use-package helm-ag)
(use-package helm-dired-recent-dirs)
(use-package helm-github-stars
  :config
  (setq helm-github-stars-username "chillaranand"))

(use-package helm-swoop
  :config
  (setq helm-swoop-speed-or-color t)
  (setq helm-swoop-split-with-multiple-windows t)
  (global-set-key "\C-s" 'helm-swoop-without-pre-input))


(use-package helm
  :config

  (require 'helm-eshell)

  (defvar helm-source-emacs-commands
    (helm-build-sync-source "Emacs commands"
      :candidates (lambda ()
                    (let ((cmds))
                      (mapatoms
                       (lambda (elt) (when (commandp elt) (push elt cmds))))
                      cmds))
      :coerce #'intern-soft
      :action #'command-execute)
    "A simple helm source for Emacs commands.")

  (defvar helm-source-emacs-commands-history
    (helm-build-sync-source "Emacs commands history"
      :candidates (lambda ()
                    (let ((cmds))
                      (dolist (elem extended-command-history)
                        (push (intern elem) cmds))
                      cmds))
      :coerce #'intern-soft
      :action #'command-execute)
    "Emacs commands history")

  (setq helm-mini-default-sources '(helm-source-buffers-list
                                    helm-source-recentf
                                    ;; helm-source-dired-recent-dirs
                                    ;; helm-source-emacs-commands-history
                                    ;; helm-source-emacs-commands
                                    ;; helm-chrome-source
                                    ;; hgs/helm-c-source-stars
                                    ;; hgs/helm-c-source-repos
                                    ;; helm-source-buffer-not-found
                                    ;; hgs/helm-c-source-search
                                    ))

  (setq  helm-ff-newfile-prompt-p              nil
         helm-echo-input-in-header-line        t
         helm-M-x-always-save-history          t
         helm-split-window-in-side-p           t
         helm-buffers-fuzzy-matching           t
         helm-move-to-line-cycle-in-source     t
         helm-ff-search-library-in-sexp        t
         helm-ff-file-name-history-use-recentf t)

  (bind-key "C-c C-o" 'helm-buffer-switch-other-window))


(use-package helm-flx
  :config
  (helm-flx-mode +1)
  (setq helm-flx-for-helm-find-files t ;; t by default
        helm-flx-for-helm-locate t))

;; swiper for search
;; (use-package ivy)
;; (use-package swiper-helm
;;   :config
;;   (ivy-mode 1)
;;   ;; make swiper to use helm display
;;   (setq swiper-helm-display-function 'helm-default-display-buffer)
;;   (setq ivy-use-virtual-buffers t)
;;   (global-set-key "\C-s" 'swiper-helm)
;;   (global-set-key "\C-r" 'swiper-helm)
;;   (global-set-key (kbd "C-c C-r") 'ivy-resume)
;;   (global-set-key [f8] 'ivy-resume))


;; (use-package aggressive-indent
;;   :config
;;   (global-aggressive-indent-mode 1))


(use-package google-translate
  :config
  (setq  google-translate-default-source-language "en")
  (setq  google-translate-default-target-language "kn")
  (require 'google-translate-default-ui))


(use-package ace-link
  :config
  (ace-link-setup-default "f"))


(use-package sotlisp)


(use-package benchmark-init
  :config
  (benchmark-init/activate))



;; writing

(use-package writegood-mode)
(use-package writeroom-mode)
(use-package artbollocks-mode)

(use-package markdown-mode
  :config
  ;; (add-hook 'markdown-mode-hook 'writeroom-mode)
  (add-hook 'markdown-mode-hook 'writegood-mode)
  (add-hook 'markdown-mode-hook 'artbollocks-mode))


(use-package auto-capitalize
  :config
  (autoload 'auto-capitalize-mode "auto-capitalize"
    "Toggle `auto-capitalize' minor mode in this buffer." t)
  (autoload 'turn-on-auto-capitalize-mode "auto-capitalize"
    "Turn on `auto-capitalize' minor mode in this buffer." t)
  (autoload 'enable-auto-capitalize-mode "auto-capitalize"
    "Enable `auto-capitalize' minor mode in this buffer." t)
  (defun cap ()
    (auto-capitalize-mode))
  (add-hook 'org-mode-hook 'cap)
  (add-hook 'markdown-mode-hook 'cap)
  (defvar auto-capitalize-words
    '("I" "Python" "Emacs" "You")))


(use-package keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))


(use-package key-chord
  :config
  ;; (setq key-chord-one-keys-delay 0.5)
  ;; (setq key-chord-two-keys-delay 0.5)
  )


(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom))


(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))


(use-package bm
  :config
  (global-set-key (kbd "<f5>") 'bm-toggle)
  (global-set-key (kbd "<f7>") 'bm-next)
  (global-set-key (kbd "<f6>") 'bm-previous))

(use-package hl-line
  :config
  (global-hl-line-mode 1))


(use-package flycheck-pos-tip
  :config
  (eval-after-load 'flycheck
    '(custom-set-variables
      '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))


(use-package lispy
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

  (define-key lispy-mode-map (kbd "C-;") #'comment-or-uncomment-sexp)
  (define-key lispy-mode-map (kbd "M-m") nil)
  ;; (define-key lispy-mode-map (kbd "C-k") #'my-lispy-kill)
  (define-key lispy-mode-map (kbd "C-c C-v") #'eval-buffer))


(use-package paradox)


;; sql config
(require 'sql)
(use-package sqlup-mode
  :config
  (add-hook 'sql-mode-hook 'sqlup-mode))

(use-package sql-indent
  :config
  (eval-after-load "sql"
    '(load-library "sql-indent")))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(sql-set-product "mysql")
(setq sql-port 3306)
(setq sql-connection-alist
      '(
        (pool-server
         (sql-server sql-server-address)
         (sql-user sql-server-user)
         (sql-password sql-server-password)
         (sql-database sql-server-database)
         (sql-port sql-port))
        (pool-local
         (sql-server sql-local-server)
         (sql-user sql-local-user)
         (sql-password sql-local-password)
         (sql-database sql-local-database)
         (sql-port sql-port))))

(defun sql-connect-preset (name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (eval `(let ,(cdr (assoc name sql-connection-alist))
           (flet ((sql-get-login (&rest what)))
             (sql-product-interactive sql-product)))))

(defun sql-pool-server ()
  (interactive)
  (sql-connect-preset 'pool-server))

(defun sql-pool-local ()
  (interactive)
  (sql-connect-preset 'pool-local))

(defun mysql-get-or-create-process ()
  "Get or create an inferior Python process for current buffer and return it."
  (sql-connect))

(defun mysql-send-paragraph ()
  (interactive)
  (sql-connect)
  (sql-send-paragraph)
  (with-current-buffer (process-buffer (get-process "SQL"))
    (set-window-point (get-buffer-window (current-buffer))
                      (point-max))))

(defun sql-add-newline-first (output)
  "Add newline to beginning of OUTPUT for `comint-preoutput-filter-functions'"
  (remove-hook 'comint-preoutput-filter-functions
               'sql-add-newline-first)
  (concat "\n" output))

;; (defun my-sql-save-history-hook ()
;;   (let ((lval 'sql-input-ring-file-name)
;;         (rval 'sql-product))
;;     (if (symbol-value rval)
;;         (let ((filename
;;                (concat "~/.emacs.d/sql/"
;;                        (symbol-name (symbol-value rval))
;;                        "-history.sql")))
;;           (set (make-local-variable lval) filename))
;;       (error
;;        (format "SQL history will not be saved because %s is nil"
;;                (symbol-name rval))))))

;; (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)

;; (defun sql-add-newline-first (output)
;;   "Add newline to beginning of OUTPUT for `comint-preoutput-filter-functions'"
;;   (concat "\n" output))

;; (defun sqli-add-hooks ()
;;   "Add hooks to `sql-interactive-mode-hook'."
;;   (add-hook 'comint-preoutput-filter-functions
;;             'sql-add-newline-first))

;; (add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)


;; slides
;; (load-file "~/.emacs.d/vendor/htmlize.el")

(use-package htmlize)


(use-package org
  :config
  (setq org-agenda-span 30)
  (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
  (define-key org-mode-map (kbd "C-c C-c") #'org-reveal-export-to-html-and-browse))


(use-package ox-reveal
  :config
  (setq org-reveal-root "file:///home/anand/.emacs.d/vendor/reveal.js"))

(use-package ob-translate)


(use-package restclient)


(use-package coffee-mode)


;; (use-package wakatime-mode
;;   :config
;;   (setq wakatime-python-bin "/usr/bin/python")
;;   (setq wakatime-python-bin "/usr/local/bin/wakatime")
;;   (global-wakatime-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; utilities

(defun my-edit-file-as-sudo/root ()
  "Find file as root"
  (interactive)
  (let*
      ((sudo (/= (call-process "sudo" nil nil "-n true") 0))
       (file-name
        (if (tramp-tramp-file-p buffer-file-name)
            (with-parsed-tramp-file-name buffer-file-name parsed
              (tramp-make-tramp-file-name
               (if sudo "sudo" "su")
               "root"
               parsed-host
               parsed-localname
               (let ((tramp-postfix-host-format "|")
                     (tramp-prefix-format))
                 (tramp-make-tramp-file-name
                  parsed-method
                  parsed-user
                  parsed-host
                  ""
                  parsed-hop))))
          (concat (if sudo
                      "/sudo::"
                    "/su::")
                  buffer-file-name))))
    (find-alternate-file file-name)))


(defun sh-send-line-or-region (&optional step)
  (interactive ())
  (let ((proc (get-process "shell"))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (shell)
        (switch-to-buffer currbuff)
        (setq proc (get-process "shell"))
        ))
    (setq pbuff (process-buffer proc))
    (if (use-region-p)
        (setq min (region-beginning)
              max (region-end))
      (setq min (point-at-bol)
            max (point-at-eol)))
    (setq command (concat (buffer-substring min max) "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point))
      ) ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step
      (goto-char max)
      (next-line))
    ))

(defun sh-send-line-or-region-and-step ()
  (interactive)
  (sh-send-line-or-region t))
(defun sh-switch-to-process-buffer ()
  (interactive)
  (pop-to-buffer (process-buffer (get-process "shell")) t))

(global-set-key (kbd "C-x C-t") 'sh-send-line-or-region)



;; crontab edit
(defun crontab-e ()
  (interactive)
  (with-editor-async-shell-command "crontab -e"))


;; remote connection

(defun dired-remote (name)
  "Connect to a predefined server."
  (interactive
   (list
    (completing-read "Connect to: " server-connection-alist)))
  (when (not (or (equal name "")
                 (equal name nil)))
    (dired name)))


(defun is-line-empty-p ()
  "Return t if current line is empty."
  (save-excursion
    (beginning-of-line)
    (looking-at "[[:space:]]*$")))

(defun is-inside-parens-p ()
  "Return t if point is inside parens."
  (> (car (syntax-ppss)) 0))

(defun my-lispy-kill ()
  "Clean up whitespace along with lispy kill."
  (interactive)
  (if (is-line-empty-p)
      (lispy-kill)
    (if (is-inside-parens-p)
        (lispy-kill)
      (lispy-kill)
      (kill-line))))

;; remote connection
;; (defun connect-to-server ()
;;   (interactive)
;;   (dired (format  "/%s@%s:/" server-user server-host)))


;; recenter when hyperlink is clicked
(defun my-recenter-on-find-function (orig &rest args)
  (let ((result (apply orig args)))
    (when result
      (recenter 0))
    result))
(advice-add 'help-button-action :around #'my-recenter-on-find-function)


(defun delete-whole-line (&optional arg)
  "A simple wrapper around command `kill-whole-line' that respects indentation.
Passes ARG to command `kill-whole-line' when provided."
  (interactive "p")
  (kill-whole-line arg)
  (back-to-indentation))


(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))


(defun swap-numbers-symbols ()
  "Swap symbols to digits."
  (interactive)
  (define-key key-translation-map (kbd "!") (kbd "1"))
  (define-key key-translation-map (kbd "@") (kbd "2"))
  (define-key key-translation-map (kbd "#") (kbd "3"))
  (define-key key-translation-map (kbd "$") (kbd "4"))
  (define-key key-translation-map (kbd "%") (kbd "5"))
  (define-key key-translation-map (kbd "^") (kbd "6"))
  (define-key key-translation-map (kbd "&") (kbd "7"))
  (define-key key-translation-map (kbd "*") (kbd "8"))
  (define-key key-translation-map (kbd "(") (kbd "9"))
  (define-key key-translation-map (kbd ")") (kbd "0"))

  (define-key key-translation-map (kbd "1") (kbd "!"))
  (define-key key-translation-map (kbd "2") (kbd "@"))
  (define-key key-translation-map (kbd "3") (kbd "#"))
  (define-key key-translation-map (kbd "4") (kbd "$"))
  (define-key key-translation-map (kbd "5") (kbd "%"))
  (define-key key-translation-map (kbd "6") (kbd "^"))
  (define-key key-translation-map (kbd "7") (kbd "&"))
  (define-key key-translation-map (kbd "8") (kbd "*"))
  (define-key key-translation-map (kbd "9") (kbd "("))
  (define-key key-translation-map (kbd "0") (kbd ")")))

(defun swap-numbers-parens ()
  "( -> 9 and ) -> 0"
  (interactive)
  (define-key key-translation-map (kbd "(") (kbd "9"))
  (define-key key-translation-map (kbd ")") (kbd "0"))
  (define-key key-translation-map (kbd "9") (kbd "("))
  (define-key key-translation-map (kbd "0") (kbd ")")))
;; (swap-numbers-parens)


(defun current-dired ()
  (interactive)
  (dired "."))


(defun top-join-line ()
  "Join the current line with the line beneath it."
  (interactive)
  (delete-indentation 1))


   (defun launch-separate-emacs-under-x ()
     (interactive)
     (call-process "sh" nil nil nil "-c" "emacs &"))


   (defun restart-emacs ()
     (interactive)
     ;; We need the new emacs to be spawned after all kill-emacs-hooks
     ;; have been processed and there is nothing interesting left
     (add-hook 'kill-emacs-hook
               (if (display-graphic-p)
                   #'launch-separate-emacs-under-x
                 #'launch-separate-emacs-in-terminal)
               t)
     (kill-emacs))


(defun get-positions-of-line-or-region ()
  "Return positions (beg . end) of the current line
or region."
  (let (beg end)
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (cons beg end)))


(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated.  However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (pcase-let* ((origin (point))
               (`(,beg . ,end) (get-positions-of-line-or-region))
               (region (buffer-substring-no-properties beg end)))
    (-dotimes arg
      (lambda (n)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point))))
    (goto-char (+ origin (* (length region) arg) arg))))


(defun smart-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line]
                'smart-move-beginning-of-line)


(defun uncomment-sexp (&optional n)
  "Uncomment a sexp around point."
  (interactive "P")
  (let* ((initial-point (point-marker))
         (p)
         (end (save-excursion
                (when (elt (syntax-ppss) 4)
                  (re-search-backward comment-start-skip
                                      (line-beginning-position)
                                      t))
                (setq p (point-marker))
                (comment-forward (point-max))
                (point-marker)))
         (beg (save-excursion
                (forward-line 0)
                (while (= end (save-excursion
                                (comment-forward (point-max))
                                (point)))
                  (forward-line -1))
                (goto-char (line-end-position))
                (re-search-backward comment-start-skip
                                    (line-beginning-position)
                                    t)
                (while (looking-at-p comment-start-skip)
                  (forward-char -1))
                (point-marker))))
    (unless (= beg end)
      (uncomment-region beg end)
      (goto-char p)
      ;; Indentify the "top-level" sexp inside the comment.
      (while (and (ignore-errors (backward-up-list) t)
                  (>= (point) beg))
        (skip-chars-backward (rx (syntax expression-prefix)))
        (setq p (point-marker)))
      ;; Re-comment everything before it.
      (ignore-errors
        (comment-region beg p))
      ;; And everything after it.
      (goto-char p)
      (forward-sexp (or n 1))
      (skip-chars-forward "\r\n[:blank:]")
      (if (< (point) end)
          (ignore-errors
            (comment-region (point) end))
        ;; If this is a closing delimiter, pull it up.
        (goto-char end)
        (skip-chars-forward "\r\n[:blank:]")
        (when (= 5 (car (syntax-after (point))))
          (delete-indentation))))
    ;; Without a prefix, it's more useful to leave point where
    ;; it was.
    (unless n
      (goto-char initial-point))))

(defun comment-sexp--raw ()
  "Comment the sexp at point or ahead of point."
  (pcase (or (bounds-of-thing-at-point 'sexp)
             (save-excursion
               (skip-chars-forward "\r\n[:blank:]")
               (bounds-of-thing-at-point 'sexp)))
    (`(,l . ,r)
     (goto-char r)
     (skip-chars-forward "\r\n[:blank:]")
     (comment-region l r)
     (skip-chars-forward "\r\n[:blank:]"))))

(defun comment-or-uncomment-sexp (&optional n)
  "Comment the sexp at point and move past it.
If already inside (or before) a comment, uncomment instead.
With a prefix argument N, (un)comment that many sexps."
  (interactive "P")
  (if (or (elt (syntax-ppss) 4)
          (< (save-excursion
               (skip-chars-forward "\r\n[:blank:]")
               (point))
             (save-excursion
               (comment-forward 1)
               (point))))
      (uncomment-sexp n)
    (dotimes (_ (or n 1))
      (comment-sexp--raw))))


(defun upgrade-all-packages ()
  "Upgrade all packages, no questions asked."
  (interactive)
  (save-window-excursion
    (package-list-packages)
    (package-menu-mark-upgrades)
    (package-menu-execute 'no-query)))


(defun space-to-ctrl-activate ()
  "Active space2cctl."
  (interactive)
  (call-process-shell-command  "~/.01/ubuntu/bin/space2ctrl.sh" nil 0))


(defun tidy-current-buffer ()
  "Tidy html"
  (interactive)
  (async-shell-command
   (format "tidy -i -m -w 160 -ashtml -utf8 %s"
           (buffer-file-name (current-buffer)))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; key bindings


(bind-keys*
 ("<f12>" . menu-bar-mode)

 ("C-+" . text-scale-increase)
 ("C-," .  avy-goto-char)
 ("C-^" .  top-join-line)
 ("C-1" . just-one-space)

 ("C-x C-1" . delete-other-windows)
 ("C-x C-3" . split-window-right)
 ("C-x C-a" . beginning-of-buffer)
 ("C-x C-b" . switch-to-previous-buffer)
 ("C-x C-d" . duplicate-current-line-or-region)
 ;; ("C-x C-h" . mark-whole-buffer)
 ("C-x C-g" . space-to-ctrl-activate)


 ("C-x C-i" . delete-other-windows)
 ("C-x C-k" . kill-this-buffer)
 ("C-x C-m" . helm-M-x)
 ("C-x C-o" . dired-remote)
 ("C-x C-z" . end-of-buffer)
 ("C-x r l" . helm-bookmarks)

 ("C-x C-f" . helm-find-files)
 ("C-c C-g" . beginning-of-buffer)
 ("C-c C-k" . delete-other-windows)

 ("M-h" . backward-kill-word)
 ("M-o" . other-window)
 ("M-x" . helm-M-x)
 ("M-y" . helm-show-kill-ring)
 ("M-z" . zop-up-to-char)
 ("M-Z" . zop-to-char)
 ("M-?" . mark-paragraph)
 ("M-/" . hippie-expand))



;; kill lines backward
(global-set-key (kbd "C-<backspace>") (lambda ()
                                        (interactive)
                                        (kill-line 0)
                                        (indent-according-to-mode)))

(global-set-key [remap kill-whole-line] 'delete-whole-line)


;;(global-set-key (kbd "C-h") 'delete-backward-char)
(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

;; shell history.
(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (substitute-key-definition 'eshell-list-history 'helm-eshell-history eshell-mode-map)))

(substitute-key-definition 'find-tag 'helm-etags-select global-map)
(setq projectile-completion-system 'helm)
(helm-descbinds-mode)
(helm-mode 1)



(use-package engine-mode
  :config
  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "d"))





;; enable Helm version of Projectile with replacment commands
(helm-projectile-on)

;; better defaults for comint mode
(eval-after-load 'comint
  '(progn
     (define-key comint-mode-map (kbd "<up>") #'comint-previous-matching-input-from-input)
     (define-key comint-mode-map (kbd "<down>") #'comint-next-matching-input-from-input)))


(require 'key-chord)
(key-chord-mode +1)
;; (key-chord-define-global "dd" 'delete-whole-line)
(key-chord-define-global "df" 'describe-function)
(key-chord-define-global "dk" 'describe-key)
(key-chord-define-global "dv" 'describe-variable)
(key-chord-define-global "hr" 'helm-resume)
(key-chord-define-global "fj" 'helm-mini)
(key-chord-define-global "jb" 'switch-to-previous-buffer)
(key-chord-define-global "jc" 'avy-goto-char)
(key-chord-define-global "jd" 'helm-dired-recent-dirs-view)
(key-chord-define-global "jl" 'avy-goto-line)
(key-chord-define-global "js" 'helm-semantic-or-imenu)
(key-chord-define-global "kf" 'bury-buffer)
(key-chord-define-global "kw" 'delete-window)
(key-chord-define-global "md" 'current-dired)
(key-chord-define-global "mg" 'my-magit-status)
(key-chord-define-global "mx" 'helm-M-x)
(key-chord-define-global "ps" 'helm-projectile-switch-project)
(key-chord-define-global "pf" 'helm-projectile-find-file)
(key-chord-define-global "pg" 'helm-projectile-grep)
(key-chord-define-global "sm" 'set-mark-command)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hooks


(add-hook 'before-save-hook 'whitespace-cleanup)

(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

;; load do.org
;; (find-file "~/Dropbox/do.org")

(message "Successfully loaded config... ")

;; (defun byte-compile-current-buffer ()
;;   "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
;;   (interactive)
;;   (when (and (eq major-mode 'emacs-lisp-mode)
;;              (file-exists-p (byte-compile-dest-file buffer-file-name)))
;;     (byte-compile-file buffer-file-name)))

;; (byte-recompile-directory package-user-dir nil 'force)

(put 'narrow-to-region 'disabled nil)


(provide 'init)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
