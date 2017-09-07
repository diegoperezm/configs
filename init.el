(require 'package) (add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) 

;; -*- mode: elisp -*-

;; Disable the splash screen (enable it again replacing the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" .org-mode))
;; The above is the default in recent emacsen

;; prevent esc-key from translating to meta-key in terminal mode
(setq evil-esc-delay 0)


(require 'evil)
(evil-mode 1)

(unless (display-graphic-p)
 (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate) ; or (etcc-on)
          )
(setq evil-motion-state-cursor 'box)  ; █
     (setq evil-visual-state-cursor 'box)  ; █
     (setq evil-normal-state-cursor 'box)  ; █
     (setq evil-insert-state-cursor 'bar)  ; ⎸
     (setq evil-emacs-state-cursor  'hbar) ; _

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; To install it as your major mode for JavaScript editing:
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; You may also want to hook it in for shell scripts running via node.js:
;; (add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; upport for JSX is available via the derived mode `js2-jsx-mode'.  If you
;; also want JSX support, use that mode instead:

 (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
 (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))


;; To customize how it works:
;; M-x customize-group RET js2-mode RET

(setq org-src-fontify-natively t)

(add-hook 'js2-mode-hook
           #'(lambda ()
               (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
               (define-key js2-mode-map "@" 'js-doc-insert-tag)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Tabs
(setq tab-width 2)

;; Disable auto indent in js2-mode
(add-hook 'js2-mode-hook (lambda () (electric-indent-local-mode -1)))

;; change bold color
(add-to-list 'org-emphasis-alist
	     '("*" (:foreground "yellow")))


;; Wrap line
(global-visual-line-mode t)

;; Disable menu bar
 (menu-bar-mode -1)


(setq-default frame-title-format
      (list '((buffer-file-name " %f"
		(dired-directory
		 dired-directory
		 (revert-buffer-function " %b"
			 ("%b - Dir:  "
			  default-directory)))))))


