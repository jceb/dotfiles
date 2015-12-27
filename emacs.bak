(setq user-full-name "Jan Christoph Ebersbach")
(setq user-mail-address "jceb@e-jc.de")

(require 'package)
(setq package-archives '(("melpa-stable" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

                                        ; color theme
(load-theme 'adwaita)
                                        ; TODO font

                                        ; helm, a fuzzy matching mechansim
(require-package 'helm)
(require 'helm-config)
                                        ;(require 'helm-misc)
                                        ;(require 'helm-projectile)
                                        ;(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
                                        ; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
                                        ; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
                                        ; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
                                        ; (when (executable-find "curl")
                                        ;   (setq helm-google-suggest-use-curl-p t))
                                        ;(after 'projectile
                                        ;  (package 'helm-projectile))
(global-set-key (kbd "M-x") 'helm-M-x)

                                        ; enable fuzzy matching
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(setq helm-buffers-fuzzy-matching t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match    t)
;; it's not enabled everywhere yet - there's still work to do

(helm-mode 1)

                                        ; evil
(require-package 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-key
  "b" 'helm-mini
  "f" 'helm-find-files
  "k" 'kill-buffer)

(require-package 'evil)

(define-key evil-normal-state-map " " 'helm-M-x)

(evil-mode 1)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

                                        ; indent new lines
(define-key global-map (kbd "RET") 'newline-and-indent)
					; TODO auto-indendation isn't working when insert mode is started

(require-package 'evil-matchit)
(global-evil-matchit-mode t)

(require-package 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)

                                        ; surround package
(require-package 'evil-surround)
(global-evil-surround-mode t)

                                        ; visual * and #
(require-package 'evil-visualstar)
(global-evil-visualstar-mode)

					; quickly add/remove comment strings
(require-package 'evil-commentary)
(evil-commentary-mode)

                                        ; numbers package make C-a/C-x work to increment decrement numbers
(require-package 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)

					; improved version of jumplist
(require-package 'evil-jumper)
(global-evil-jumper-mode)

                                        ; don't create backup files
(setq make-backup-files nil)

                                        ; remember cursor position when reopening files
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

                                        ; highlight parenthesis in different colors
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (rainbow-delimiters-mode t)

                                        ; disable tool bar in gui mode
(tool-bar-mode -1)
                                        ; disable scroll bar
(scroll-bar-mode -1)

                                        ; show matching parent
(require-package 'autopair)
(autopair-global-mode)

					; snippets
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-snippets")
(require-package 'yasnippet)
(yas-global-mode 1)

                                        ; auto completion finden
(require-package 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
					;TODO: autocompletion of snippets doesn't work yet
;; (require-package 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; TODO: bind selection to C-n instead of M-n, same with C-1 and M-1

					; orgmode aktivieren
(require-package 'evil-org)

					; project interaction tool
					; https://github.com/bbatsov/projectile
(require-package 'projectile)
(projectile-global-mode)
;; (setq helm-projectile-fuzzy-match nil)
(require-package 'helm-projectile)
;; (helm-projectile-on)

;; (require-package 'guide-key )
;; (setq guide-key/idle-delay 0.1)
;; (setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
;; (guide-key-mode 1)  ; Enable guide-key-mode

;; TODOs
					; GNUs ausprobieren
					; syntax checking
					; C-w isn't working in command mode
					; highlight trailing spaces


(custom-set-variables
 ;; company settings
 ;; '(company-auto-complete (quote (quote company-explicit-action-p)))
 ;; '(company-minimum-prefix-length 2)
 ;; '(company-show-numbers t)
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
