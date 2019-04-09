(require 'package) 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize) 

(when (memq window-system '(mac ns x)) (exec-path-from-shell-initialize))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(setq locale-coding-system    'utf-8)
(set-terminal-coding-system   'utf-8)
(set-keyboard-coding-system   'utf-8)
(set-selection-coding-system  'utf-8)
(prefer-coding-system         'utf-8)


;; This is only needed once, near the top of the file
(eval-when-compile
;; Following line is not needed if use-package.el is in ~/.emacs.d
;  (add-to-list 'load-path "<path where use-package is installed>")
(require 'use-package))

;; Menu key to replace Alt+x
;; (when (string-equal system-type "windows-nt")
;;  (global-set-key (kbd "<apps>") 'execute-extended-command))
(global-set-key (kbd "<menu>") 'execute-extended-command)
(global-prettify-symbols-mode 1) 

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

(setq default-directory "~/Desktop/" )
;; -*- mode: elisp -*-

;; Disable the splash screen (enable it again replacing the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; Wrap line
(global-visual-line-mode t)

;; Disable menu bar
(menu-bar-mode -1)

;; auto revert mode
(global-auto-revert-mode 1)

;; frame title
(setq frame-title-format
 '(buffer-file-name "%f"
   (dired-directory dired-directory "%b")))

;; auto refresh dired when file changes
 (add-hook 'dired-mode-hook 'auto-revert-mode)

;; Add clock
(display-time-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-buffer-indent 1)
 '(custom-safe-themes
   (quote
    ("97965ccdac20cae22c5658c282544892959dc541af3e9ef8857dbf22eb70e82b" "9129c2759b8ba8e8396fe92535449de3e7ba61fd34569a488dd64e80f5041c9f" default)))
 '(default-input-method "APL-Z")
 '(electric-indent-mode nil)
 '(evil-esc-delay 0)
 '(global-whitespace-mode t)
 '(midnight-mode t)
 '(org-bullets-bullet-list (quote ("◉" "▸" "▸" "▸" "▸" "▸" "▸" "▸" "▸" "▸")))
 '(org-capture-templates
   (quote
    (("W" "Worklog" entry
      (file "/home/erretres/Desktop/worklog.org")
      "*  %<[%Y-%m-%d-%a]> %i
 


| hrs | start    | end   | theme | topic | file       | completed? |
|-----+----------+-------+-------+-------+------------+------------|
|     | %<%H:%M> |       | %?    |       |            |            |
|-----+----------|-------+-------+-------+------------+------------|
|     |          |       |       |       |            |            |
|-----+----------|-------+-------+-------+------------+------------|
|     |          |       |       |       |            |            |
|-----+----------|-------+-------+-------+------------+------------|
|     |          |       |       |       |            |            |
|-----+----------|-------+-------+-------+------------+------------|
|     |          |       |       |       |            |            |
|     |          |       |       |       |            |            |
#+TBLFM: @2$1=($3-$2);U::@3$1=($3-$2);U::@4$1=($3-$2);U::@5$1=($3-$2);U::@6$7=(@2$1+@3$1+@4$1+@5$1);U


#+BEGIN_SRC sh :dir ~/Desktop/roguelike/ 
git log --pretty=oneline --abbrev-commit --after=\"%<%Y-%m-%d 00:00>\"  --before=\" %<%Y-%m-%d 23:59>\" 
#+END_SRC"))) t)
 '(org-confirm-babel-evaluate nil)
 '(org-export-backends (quote (ascii html icalendar latex man md odt org)))
 '(org-link-frame-setup
   (quote
    ((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file-other-frame)
     (wl . wl-other-frame))))
 '(org-pretty-entities t)
 '(org-src-fontify-natively t)
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(package-selected-packages
   (quote
    (keycast avy gnu-apl-mode multiple-cursors company-web json-mode dmenu zerodark-theme linum-relative highlight-blocks highlight-parentheses yasnippet-snippets which-key web-mode use-package unicode-fonts symon sudo-edit spaceline slack rainbow-delimiters racket-mode pretty-mode prettier-js popup-kill-ring pomodoro poet-theme pkg-info pdf-tools paredit ox-gfm org-trello org-bullets markdown-mode mark-multiple magit key-chord js2-mode gif-screencast geiser exwm exec-path-from-shell evil-terminal-cursor-changer emmet-mode el-get dimmer desktop+ demo-it buffer-move bitlbee beacon auto-complete)))
 '(popup-scroll-bar-background-face t t)
 '(prettier-js-args (quote ("--parser" "babylon")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(yas-global-mode 1)
 '(yas-indent-line (quote (none)) nil nil "Customized with use-package yasnippet"))

 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation  Mono" :foundry "outline" :slant normal :weight normal :height 140 :width expanded))))
 '(mode-line ((t (:background "black" :foreground "dim gray" :box nil :width ultra-condensed :foundry "unknown" :family "Liberation Mono" :height 100))))
 '(mode-line-inactive ((t (:background "gray19" :foreground "gray40" :box (:line-width -1 :style released-button)))))
 '(org-block ((t (:background "black"))))
 '(rainbow-delimiters-base-face ((t (:inherit nil :weight bold :width extra-expanded))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "chartreuse"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "orchid1"))))
 '(rainbow-delimiters-unmatched-face ((t (:inherit rainbow-delimiters-base-face :foreground "white"))))
 '(term-color-blue ((t (:background "deep sky blue" :foreground "deep sky blue")))))

(set-face-attribute 'fringe nil :background "gray19")
(set-background-color "gray19")

(add-hook 'js2-mode-hook
          (lambda ()
            (face-remap-add-relative 'default :background "black")))

(defun prettify-list (l &optional merge)
  "Takes two lists and interleaves the (optional) second between each element of the first.  Used to 
create multi-character sequences for use with prettify-symbols mode.  If not supplied, MERGE defaults
to '(Br . Bl)"
  (let ((merge (or merge '(Br . Bl)))
		(head (car l))
		(tail (cdr l)))
	(cond
	 ((not (consp l))    '())
	 ((not (consp tail))  (list head))
	 (t (cons head
			  (cons merge
					(prettify-list tail merge)))))))

(defun prettify-string (s &optional merge)
  "Takes a string and an optional list, and returns a list of the string's characters with MERGE
interleaved between each character, for use with prettify-symbols mode.  If no MERGE is supplied,
uses the prettify-list default."
(prettify-list (append s nil) merge))

(defun prettify-set ()
  (setq prettify-symbols-alist
		`(
	          (".map"         . ,(prettify-string   " ↦ "))  ; 21A6 
		  (".assign"      . ,(prettify-string   " ↤ "))  ; 21A4
		  (".pop"         . ,(prettify-string   " ↥ "))  ;  21A5
		  (".push"        . ,(prettify-string   " ↧ "))  ; 21A7
		  ("Math.sqrt"    . ,(prettify-string   " √ "))  ; 221A   
		  ("Math.floor"   . ,(prettify-string   " ⌊ "))  ; 230A   
                  (".forEach"     . ,(prettify-string   " ¨"))  ; #x00A8   
		  (".filter"      . ,(prettify-string   " σ"))  ; #x03C3 / greek small letter sigma
		  ("Math.random"  . ,(prettify-string   " ⍰"))  ; 2370  / APL functional symbol quad question
		  ("length"       . ,(prettify-string   "ρ"))  ; 03C1  / greek small letter rho
		  ("index"        . ,(prettify-string   "ι"))  ; 03B9  / greek small letter iota
		  (".reduce"      . ,(prettify-string   " /"))  ; #x002F  
		  (".transition"  . ,(prettify-string   " δ"))  ; #x03B4 / greek small letter delta
 		  ("elem2"        . ,(prettify-string   "∈2"))  ; 2208
 		  ("elem3"        . ,(prettify-string   "∈3"))  ; 2208
 		  ("elem"         . ,(prettify-string   "∈"))  ; 2208
                  ("switch"       . ,(prettify-string   "🝘" )) ; 1F758 / Alchemical symbol pot ashes
                  (".reverse()"  . ,(prettify-string    " ⌽ ")) ; 233D / APL reversal 
	          ("return"       . ,(prettify-string   "↲" ))   ; 21B2  
                  ("case"         . ,(prettify-string   "➜"))  ; 279C
		  ("function"     . ,(prettify-string   "λ"))   ; 03BB / greek  small letter lambda 
		  ("="            . ,(prettify-string   "←"))   ; 2190  / js assignment 
        	  ("==="          . ,(prettify-string   "≡"))   ; 2261  / triple bar -js strict comparison
		  ("&&"           . ,(prettify-string   "∧"))   ; 2227
		  ("||"           . ,(prettify-string   "∨"))   ; 2228
                  ("=>"           . ,(prettify-string   "⇒"))   ; 21D2
		  (">="           . ,(prettify-string   "≥"))   ; 2265
		  ("<="           . ,(prettify-string   "≤"))   ; 2264
		  ("for"          . ,(prettify-string   "∀"))   ; 2200
        	  ("!="           .  ,(prettify-string   "≠"))  ; 2260    
		  ("!"            .  ,(prettify-string   "¬"))  ; 0xAC  / not sign
	          ("console.log"  .  ,(prettify-string   "⎙")) ; x2399 / print screen
		  (" / "          .  ,(prettify-string   "÷"))  ; #x00F7 
                  ("alpha"        .  ,(prettify-string   "α"))  ; 03B1  
                  ("beta"         .  ,(prettify-string   "β"))  ; 03B2  
		  ("phi"          .  ,(prettify-string   " φ"))  ; 03C6  / greek small letter phi
                  ("psi"          .  ,(prettify-string   " ψ"))  ; 03C8  / greek small letter psi
		  ("|>"           .  ,(prettify-string   "▷"))
		  ("<|"           .  ,(prettify-string   "◁"))
                  ("->>"          .  ,(prettify-string   "↠"))
		  ("true"         .  ?T)
		  ("false"        .  ?F)
		  ("state"        .  ?S))))  
 

(add-hook 'js-mode-hook  'prettify-set)

;;; https://github.com/larstvei/ox-gfm
(use-package ox-gfm
  :ensure t
  :config
  (with-eval-after-load 'org
   (require 'ox-gfm nil t)))

; (eval-after-load "org"
;  '(require 'ox-gfm nil t))

;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(use-package yasnippet
  :ensure t
  :custom
  (yas-indent-line '(none))
  (yas-global-mode 1)) 

(ac-config-default)
(setq ac-auto-show-menu 0.8)
 (add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/elpa/auto-complete-20170124.1845/dict")

(add-to-list 'ac-modes 'org-mode)
 (set-default 'ac-sources
 '(ac-source-abbrev
 ac-source-dictionary
 ac-source-yasnippet nil
 ac-source-words-in-buffer
 ac-source-words-in-same-mode-buffers
 ac-source-semantic))

;; Fix: problems with magit ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Fix: Desktop-save-mode does not save on exit
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)

;; EXWM CONFIG
(require 'exwm)
(require 'exwm-config)
(require 'exwm-randr)

(setq exwm-randr-workspace-output-plist '(0 "VGA1" 1 "HDMI1"))

(add-hook 'exwm-randr-screen-change-hook
	  (lambda ()
	    (start-process-shell-command
	      "xrandr" nil "xrandr --output VGA1 --below  HDMI1 --auto")))
(exwm-randr-enable)


(setq exwm-manage-force-tiling t)

 ;; emacs as a daemon, use "emacsclient <filename>" to seamlessly edit files from the terminal directly in the exwm instance
; (server-start)

;; this fixes issues with ido mode, if you use helm, get rid of it
(exwm-config-ido)

; Set the initial number of workspaces (they can also be created later).
(setq exwm-workspace-number 2)

; All buffers created in EXWM mode are named "*EXWM*". You may want to
; change it in `exwm-update-class-hook' and `exwm-update-title-hook', which
; are run when a new X window class name or title is available.  Here's
; some advice on this topic:
; + Always use `exwm-workspace-rename-buffer` to avoid naming conflict.
; + For applications with multiple windows (e.g. GIMP), the class names of
;    all windows are probably the same.  Using window titles for them makes
;   more sense.
; In the following example, we use class names for all windows expect for
; Java applications and GIMP.
(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-title))))

  
;; https://github.com/daedreth/UncleDavesEmacs
;; this is a way to declare truly global/always working keybindings
;; this is a nifty way to go back from char mode to line mode without using the mouse
(exwm-input-set-key (kbd "s-r") #'exwm-reset)
(exwm-input-set-key (kbd "s-k") #'exwm-workspace-delete)
(exwm-input-set-key (kbd "M-w") #'exwm-workspace-swap)
(exwm-input-set-key (kbd "M-<tab>") #'exwm-workspace-switch)
(exwm-input-set-key (kbd "s-w") #'exwm-input-toggle-keyboard)

; https://github.com/daedreth/UncleDavesEmacs
; the simplest launcher, I keep it in only if dmenu eventually stopped working or something
(exwm-input-set-key (kbd "M-4")
                        (lambda (command)
                          (interactive (list (read-shell-command "$ ")))
                          (start-process-shell-command command nil command)))

; https://github.com/daedreth/UncleDavesEmacs
; an easy way to make keybindings work *only* in line mode
    (push ?\C-q exwm-input-prefix-keys)
    (define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)

;; https://github.com/daedreth/UncleDavesEmacs
; simulation keys are keys that exwm will send to the exwm buffer upon inputting a key combination
(exwm-input-set-simulation-keys
 '(
  ;; movement
  ([?\C-b] . left)
  ([?\M-b] . C-left)
  ([?\C-f] . right)
  ([?\M-f] . C-right)
  ([?\C-p] . up)
  ([?\C-n] . down)
  ([?\C-a] . home)
  ([?\C-e] . end)
  ([?\M-v] . prior)
  ([?\C-v] . next)
  ([?\C-d] . delete)
  ([?\C-k] . (S-end delete))
  ;; cut/paste
  ([?\C-w] . ?\C-x)
  ([?\M-w] . ?\C-c)
  ([?\C-y] . ?\C-v)
  ;; search
  ([?\C-s] . ?\C-f)))

;; https://github.com/daedreth/UncleDavesEmacs
;; this little bit will make sure that XF86 keys work in exwm buffers as well
(dolist (k '(XF86AudioLowerVolume
             XF86AudioRaiseVolume
             XF86PowerOff
             XF86AudioMute
             XF86AudioPlay
             XF86AudioStop
             XF86AudioPrev
             XF86AudioNext
             XF86ScreenSaver
             XF68Back
             XF86Forward
             Scroll_Lock
             print))
(cl-pushnew k exwm-input-prefix-keys))

;; Do not forget to enable EXWM. It will start by itself when things are
;; ready.  You can put it _anywhere_ in your configuration.
(exwm-enable)


;(eval-after-load 'exwm  (exwm-randr-enable)) 

;and then, in my system ~/.profile,
;xrandr --newmode "1600x900_60.00"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync
;xrandr --addmode eDP1 1600x900_60.00
;xrandr --output eDP1 --mode 1600x900_60.00



;; %i Initial content,
;; the region when capture is called while the region is active.
;; The entire text will be indented like %i itself.
;; %?  After completing the template, position cursor here.

;; web-mode
;; Indentations
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Highlight of columns
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

;; Emmet settings
(add-hook 'web-mode-hook  'emmet-mode) 
(add-hook 'web-mode-before-auto-complete-hooks
	  '(lambda ()
	     (let ((web-mode-cur-language
		    (web-mode-language-at-pos)))
	       (if (string= web-mode-cur-language "css")
		   (setq emmet-use-css-transform t)
		 (setq emmet-use-css-transform nil)))))

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
 (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
 (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
 (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
 (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
 (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
 (add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(require 'eldoc) ; if not already loaded
    (eldoc-add-command
     'paredit-backward-delete
     'paredit-close-round)

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1) ))

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
   (defun override-slime-repl-bindings-with-paredit ()
     (define-key slime-repl-mode-map
       (read-kbd-macro paredit-backward-delete-key) nil))
       (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "{")
       'paredit-open-curly)
     (define-key paredit-mode-map (kbd "}")
       'paredit-close-curly)))

(load (expand-file-name "~/quicklisp/slime-helper.el"))
 ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "/usr/local/bin/sbcl")

;; pdf-tools dark 
;; Mx pdf-view-mode  ret Mx pdf-view-midnight-minor-mode
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)

(add-to-list 'auto-mode-alist '("\\.ts\\'"     .  web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'"  .  web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'"   .  css-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'"     .  js2-mode))
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" .  js2-mode))

(global-unset-key (kbd "C-x C-z"))
(global-set-key (kbd "<C-s-up>")     'buf-move-up)
(global-set-key (kbd "<C-s-down>")   'buf-move-down)
(global-set-key (kbd "<C-s-left>")   'buf-move-left)
(global-set-key (kbd "<C-s-right>")  'buf-move-right)

(global-set-key (kbd "s-C-l") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-h") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-k") 'shrink-window)
(global-set-key (kbd "s-C-j") 'enlarge-window)

;; Magit
(global-set-key (kbd "C-x m") (lambda() (interactive) (magit-status) (evil-mode)))

; save and tangle 
(global-set-key (kbd "<f4>") (lambda() (interactive) (save-buffer)(org-babel-tangle) (evil-force-normal-state)))

; save and tangle 
(global-set-key (kbd "<f1>") (lambda() (interactive) (save-buffer)(org-babel-tangle-block) (evil-force-normal-state)))

;; orgmode save export to markdown  
(global-set-key (kbd "<f2>") (lambda() (interactive) (save-buffer) (org-gfm-export-to-markdown) (evil-force-normal-state)))

;; orgmode save and export to html  
(global-set-key (kbd "<f3>") (lambda() (interactive) (save-buffer) (org-html-export-to-html) (evil-force-normal-state)))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-s"  'save-buffer)


;; Evil mode
(use-package evil
 :ensure t
 :config
 (evil-mode 1)
 (evil-set-initial-state 'lisp-mode    'emacs)
 (setq  
        evil-normal-state-cursor '(box "green")
        evil-insert-state-cursor '((bar . 5) "red")
        evil-visual-state-cursor '(hollow)
        evil-emacs-state-cursor  '(box "blue"))
 :custom
 (evil-esc-delay 0))

;;;  EVIL TERMINAL CURSOR 

; (unless (display-graphic-p)
;  (require 'evil-terminal-cursor-changer)
;  (evil-terminal-cursor-changer-activate)) ; or (etcc-on))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(global-set-key (kbd "C-x b") 'ibuffer)


(use-package mark-multiple
  :ensure t
  :bind ("C-c q" . 'mark-next-like-this))

(use-package multiple-cursors
  :ensure t)

(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->")     'mc/mark-next-like-this)
(global-set-key (kbd "C-<")     'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; briefly highlight cursor when changing buffer 
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring)
  :custom
 (popup-scroll-bar-background-face t :background "black"))


(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package sudo-edit
  :ensure t
  :bind
 ("s-e" . sudo-edit))

(use-package org 
  :mode (("\\.org$" . org-mode))
  :init
  (font-lock-add-keywords 'org-mode
			  '(("^ +\\([-*]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  :bind
  ("C-c b" .  org-babel-tangle-block)
  :config
   (define-key org-mode-map "\C-ct" 'insert-current-time)
   (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (sql    . t)
     (shell  . t) 
     (scheme . t) 
     (js     . t)
     (C      . t)
     (dot    . t)))
(add-to-list 'org-emphasis-alist '("*" (:foreground "yellow")))
(add-to-list 'org-src-lang-modes '("js2"       .  js2))
(add-to-list 'org-structure-template-alist
 '("apl"  "#+NAME:?\n#+BEGIN_SRC apl\n\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
 '("sh"  "#+NAME: \n#+BEGIN_SRC sh\n?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
 '("js"  "#+NAME:?\n#+BEGIN_SRC js\n\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
 '("css"  "#+NAME: \n#+BEGIN_SRC css\n?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
 '("h"  "#+NAME: \n#+BEGIN_SRC html\n?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
 '("lisp"  "#+NAME: \n#+BEGIN_SRC lisp\n?\n#+END_SRC"))
  :custom-face
  (org-block ((t (:background "black"))))
;  (org-block-begin-line ((t (:foreground "gray40"))))
  :custom
  (org-pretty-entities t)
  (org-export-backends (quote (ascii html icalendar latex man md odt org)))
  (org-src-fontify-natively t)
  (org-confirm-babel-evaluate nil)
  (org-link-frame-setup
   (quote
    ((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame) (gnus . org-gnus-no-new-news)
     (file . find-file-other-frame)
     (wl . wl-other-frame))))
(org-capture-templates
 '(("W" "Worklog" entry (file "/home/erretres/Desktop/worklog.org" )
    "*  %<[%Y-%m-%d-%a]> %i\n 


| hrs | start    | end   | theme | topic | file       | completed? |
|-----+----------+-------+-------+-------+------------+------------|
|     | %<%H:%M> |       | %?    |       |            |            |
|-----+----------|-------+-------+-------+------------+------------|
|     |          |       |       |       |            |            |
|-----+----------|-------+-------+-------+------------+------------|
|     |          |       |       |       |            |            |
|-----+----------|-------+-------+-------+------------+------------|
|     |          |       |       |       |            |            |
|-----+----------|-------+-------+-------+------------+------------|
|     |          |       |       |       |            |            |
|     |          |       |       |       |            |            |
#+TBLFM: @2$1=($3-$2);U::@3$1=($3-$2);U::@4$1=($3-$2);U::@5$1=($3-$2);U::@6$7=(@2$1+@3$1+@4$1+@5$1);U\n

#+BEGIN_SRC sh :dir ~/Desktop/roguelike/ 
git log --pretty=oneline --abbrev-commit \
--after=\"%<%Y-%m-%d 00:00>\"  --before=\" %<%Y-%m-%d 23:59>\" 
#+END_SRC"))))


;; Bullets points
(use-package org-bullets
   :ensure t
   :init (add-hook 'org-mode-hook 'org-bullets-mode)
   :custom
   (org-bullets-bullet-list '("◉" "▸" "▸" "▸" "▸" "▸" "▸" "▸" "▸" "▸")))

(use-package  org-trello
  :ensure t
  :config
  (setq org-trello-files '("~/Desktop/BLOG/trello.org"
			   "~/Desktop/new_notes/trello_lisp.org"))
  :custom
  (org-trello-current-prefix-keybinding "C-c o" nil (org-trello)))

(use-package pomodoro
  :ensure t
  :config 
 (setq org-pomodoro-length 25)
 (setq pomodoro-play-sounds nil)
 (setq org-pomodoro-sound-player nil)
 (pomodoro-add-to-mode-line))

 (define-key global-map "\C-cp" 'pomodoro-start )

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map  "jj" 'evil-normal-state))

(use-package prettier-js
  :init
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'js-mode-hook  'prettier-js-mode)
  :custom
  (prettier-js-args '("--parser" "babylon")))
;(setq prettier-js-args '("--parser" "babylon"))


(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
  :custom-face
  (rainbow-delimiters-base-face ((t (:inherit nil :weight bold :width extra-expanded)))) 
  (rainbow-delimiters-unmatched-face ((t ( :inherit rainbow-delimiters-base-face :foreground "white"))))
  (rainbow-delimiters-depth-1-face ((t ( :inherit rainbow-delimiters-base-face :foreground "orange"))))
  (rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "chartreuse"))))
  (rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep sky blue"))))
  (rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "orchid1"))))) 

(use-package highlight-blocks
 :ensure  t
 :init (add-hook 'lisp-mode-hook 'highlight-blocks-mode))


(use-package buffer-move :ensure t)

;; babel tangle block
(defun org-babel-tangle-block()
  (interactive)
  (let ((current-prefix-arg '(4)))
     (call-interactively 'org-babel-tangle)))

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
  (interactive)
  (insert (format-time-string "%H:%M" (current-time))))

(defun capture-report-data-file (path)
  (let ((name (read-string "Name: ")))
    (expand-file-name (format "%s-%s.markdown" (format-time-string "%Y-%m-%d") name) path)))

(defun launch-firefox ()
  (interactive)
  (exwm-async-run "firefox"))

(global-set-key (kbd "C-c f") 'launch-firefox)

(defun launch-terminal ()
  (interactive)
  (exwm-async-run "st"))

(global-set-key (kbd "C-c t")   'launch-terminal)
(global-set-key (kbd "C-M-s-k") 'close-all-buffers)
(global-set-key (kbd "C-c e")    'config-visit)

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun worklog ()
  (interactive)
  (find-file "~/Desktop/worklog.org"))
(global-set-key (kbd "C-c w") 'worklog)


(defun shutdown ()
   (interactive)
    (start-process-shell-command "halt" nil " shutdown -h now"))


(defun shutdown-r()
   (interactive)
    (start-process-shell-command "halt" nil " shutdown -r now"))

(defun exwm-async-run (name)
  (interactive)
  (start-process name nil name))

(defun launch-discord ()
  (interactive)
  (exwm-async-run "discord"))

 (defun less-bright ()
    (interactive)
    (start-process "bright" nil  "xbacklight" "-10" ))

 (defun more-bright ()
    (interactive)
    (start-process "brightplus" nil  "xbacklight" "+10" ))

;; Auto-rename new eww buffers
(defun xah-rename-eww-hook ()
  "Rename eww browser's buffer so sites open in new page."
  (rename-buffer "eww" t))
   (add-hook 'eww-mode-hook #'xah-rename-eww-hook)


;; SCREENSHOTS
;  daedretch/UncleDavesEmacs

(defun take-screenshot ()
  "Takes a fullscreen screenshot of the current workspace"
  (interactive)
  (when window-system
  (loop for i downfrom 3 to 1 do
        (progn
          (message (concat (number-to-string i) "..."))
          (sit-for 1)))
  (message "Cheese!")
  (sit-for 1)
  (start-process "screenshot" nil "import" "-window" "root" 
             (concat (getenv "HOME") "/" (subseq (number-to-string (float-time)) 0 10) ".png"))
  (message "Screenshot taken!")))
(global-set-key (kbd "<print>") 'take-screenshot)


(defun take-screenshot-region ()
  "Takes a screenshot of a region selected by the user."
  (interactive)
  (when window-system
  (call-process "import" nil nil nil ".newScreen.png")
  (call-process "convert" nil nil nil ".newScreen.png" "-shave" "1x1"
                (concat (getenv "HOME") "/" (subseq (number-to-string (float-time)) 0 10) ".png"))
  (call-process "rm" nil nil nil ".newScreen.png")))
(global-set-key (kbd "<Scroll_Lock>") 'take-screenshot-region)


(defun close-all-buffers ()
  "Kill all buffers without regard for their origin."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))


(defun my-web-mode-hook ()
"Hooks for Web mode."
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2))

;; eww background color
(setq shr-color-visible-luminance-min 70)

 (use-package zerodark-theme
  :ensure t
  :init
  (load-theme 'zerodark t))

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package async 
  :ensure t
  :init (dired-async-mode 1))

(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
; (setq dashboard-startup-banner "~/.emacs.d/img/dashLogo.png")
; (setq dashboard-items '((recents  . 5)
                            ;(projects . 5)))
    (setq dashboard-items '((recents . 10)))
    (setq dashboard-banner-logo-title ""))

(use-package linum-relative
  :ensure t
  :config
    (setq linum-relative-current-symbol "")
    (add-hook 'prog-mode-hook 'linum-relative-mode))



(use-package expand-region
  :ensure t
  :bind ("C-q" . er/expand-region))

(use-package flycheck 
  :ensure t)

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "SPC") #'company-abort))

(add-hook 'c++-mode-hook 'yas-minor-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)

(use-package flycheck-clang-analyzer
  :ensure t
  :config
  (with-eval-after-load 'flycheck
    (require 'flycheck-clang-analyzer)
     (flycheck-clang-analyzer-setup)))

(with-eval-after-load 'company
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode))

(use-package company-c-headers
  :ensure t)

(use-package company-irony
  :ensure t
  :config
  (setq company-backends '((company-c-headers
                            company-dabbrev-code
                            company-irony))))
(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package slime-company
  :ensure t
  :init
    (require 'company)
    (slime-setup '(slime-fancy slime-company)))

(use-package htmlize
  :ensure t)

;(setq erc-nick "")
;(setq erc-prompt (lambda () (concat "[" (buffer-name) "]")))
;(setq erc-hide-list '("JOIN" "PART" "QUIT"))

; (setq erc-server-history-list '("irc.freenode.net"
;                                "localhost"))

; (use-package erc-hl-nicks
;  :ensure t
;  :config
;  (erc-update-modules))

(use-package json
  :ensure t
  :mode (("\\.json$" . json-mode)))

(use-package company-web
  :ensure t
  :mode (("\\.html$" . web-mode)))

 (use-package ido
  :bind ("C-d" . 'ido-switch-to-dired))

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(use-package gnu-apl-mode
  :mode (("\\.apl$" . gnu-apl-mode)))


(use-package gif-screencast
 :ensure t)

(with-eval-after-load 'gif-screencast
  (define-key gif-screencast-mode-map (kbd "<f8>") 'gif-screencast-toggle-pause)
  (define-key gif-screencast-mode-map (kbd "<f9>") 'gif-screencast-stop))

(use-package whitespace
  :config
  ;; add spaces?
  (setq whitespace-style '(face empty tabs  lines-tail trailing)
	whitespace-line-column 80)
  (global-whitespace-mode t)
  :custom-face
  (trailing-whitespace ((t (:background "red1"))))
  (whitespace-big-indent ((t (:background "blue" :foreground "firebrick1"))))
  (whitespace-empty ((t (:background "#da8547" :foreground "#3e4451"))))
  (whitespace-line ((t (:foreground "#ff6c6b"))))
  (whitespace-trailing ((t (:background "#ff6c6e" :foreground "#282c34" :inverse-video nil :weight bold)))))


; '(trailing-whitespace ((t (:background "red"))))
; '(whitespace-big-indent ((t (:background "red1" :foreground "firebrick1"))))
; '(whitespace-empty ((t (:background "#da8547" :foreground "#3e4451"))))
; '(whitespace-line ((t (:foreground "#ff6c6b"))))
; '(whitespace-trailing ((t (:background "#ff6c6e" :foreground "#282c34" :inverse-video nil :weight bold))))



 (defun org-babel-execute:apl (body params)
  "Execute a block of apl code with org-babel."
  (message "executing apl source code block")
  (org-babel-eval "apl -s --echoCIN --rawCIN" body))



; start-process-shell-command
;; Always at the end
(setq-default ispell-program-name "aspell")
