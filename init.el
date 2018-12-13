(require 'package) 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize) 
(when (memq window-system '(mac ns x)) (exec-path-from-shell-initialize))
(setq follow-mode t)

;; Menu key to replace Alt+x
;; (when (string-equal system-type "windows-nt")
;;  (global-set-key (kbd "<apps>") 'execute-extended-command))
(global-set-key (kbd "<menu>") 'execute-extended-command)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-stable")

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
(define-key global-map "\C-s" 'save-buffer)

;;(setq-default indent-tabs-mode nil)
;(setq-default tab-width 2)
;;(setq indent-line-function 'insert-tab)

;; Tabs
;;(setq tab-width 2)

;; Disable auto indent in js2-mode
;;(add-hook 'js2-mode-hook (lambda () (electric-indent-local-mode -1)))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
; '(ido-enable-flex-matching t)
; '(ido-mode (quote both) nil (ido))
 '(org-export-backends (quote (ascii html icalendar latex man md odt org)))
 '(package-selected-packages
   (quote
   (js-comint htmlize pdf-tools emmet-mode web-mode prettier-js js2-mode flycheck org-bullets exec-path-from-shell key-chord el-get use-package evil-terminal-cursor-changer evil auto-complete))) 
 '(pomodoro-play-sounds nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

 (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
 (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-mode))
 (custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(ansi-color-names-vector
    ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
  '(blink-cursor-mode nil)
  '(column-number-mode t)
  '(custom-enabled-themes (quote (tango-dark)))
;  '(ido-enable-flex-matching t)
;  '(ido-mode (quote both) nil (ido))
  '(package-selected-packages
    (quote
    (js-comint htmlize pdf-tools emmet-mode web-mode prettier-js js2-mode flycheck org-bullets exec-path-from-shell key-chord el-get use-package evil-terminal-cursor-changer evil auto-complete))) 
  '(pomodoro-play-sounds nil)
  '(scroll-bar-mode nil)
  '(show-paren-mode t)
  '(tool-bar-mode nil))

  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(eww-form-file ((t (:background "dim gray" :foreground "black" :box (:line-width 2 :style released-button)))))
 '(eww-form-submit ((t (:background "dim gray" :foreground "black" :box (:line-width 2 :style released-button)))))
 '(eww-form-text ((t (:background "black" :foreground "white" :box 1))))
 '(eww-form-textarea ((t (:background "dim gray" :foreground "black" :box 1))))
 '(ido-indicator ((t (:background "dark salmon" :foreground "yellow1" :width condensed))))
 '(mode-line ((t (:background "black" :foreground "dim gray" :box nil :width ultra-condensed :foundry "unknown" :family "Liberation Mono"))))
 '(mode-line-inactive ((t (:background "gray19" :foreground "gray40" :box (:line-width -1 :style released-button)))))
 '(popup-scroll-bar-background-face ((t (:background "black"))))
 '(org-block-begin-line
   ((t (:foreground "gray40"))))
 '(org-block
    ((t (:background "black"))))
 '(scroll-bar-mode -1)
 '(term-color-blue ((t (:background "deep sky blue" :foreground "deep sky blue")))))
 (set-face-attribute 'fringe nil :background "gray19") (set-background-color "gray19")

(add-hook 'js2-mode-hook
          (lambda ()
            (face-remap-add-relative 'default :background "black")))

(require 'exwm)
(require 'exwm-config)

(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '(0 "HDMI1" 1 "VGA1"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
             "xrandr" nil "xrandr --output VGA1  HDMI1 --auto")))
(exwm-randr-enable)

;;(require 'exwm-systemtray)
;;(exwm-systemtray-enable)

;; Set the initial number of workspaces (they can also be created later).
(setq exwm-workspace-number 3)

;; All buffers created in EXWM mode are named "*EXWM*". You may want to
;; change it in `exwm-update-class-hook' and `exwm-update-title-hook', which
;; are run when a new X window class name or title is available.  Here's
;; some advice on this topic:
;; + Always use `exwm-workspace-rename-buffer` to avoid naming conflict.
;; + For applications with multiple windows (e.g. GIMP), the class names of
;    all windows are probably the same.  Using window titles for them makes
;;   more sense.
;; In the following example, we use class names for all windows expect for
;; Java applications and GIMP.
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

;; https://github.com/daedreth/UncleDavesEmacs
;; the simplest launcher, I keep it in only if dmenu eventually stopped working or something
(exwm-input-set-key (kbd "M-4")
                        (lambda (command)
                          (interactive (list (read-shell-command "$ ")))
                          (start-process-shell-command command nil command)))

;; https://github.com/daedreth/UncleDavesEmacs
;; an easy way to make keybindings work *only* in line mode
    (push ?\C-q exwm-input-prefix-keys)
    (define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)

;; https://github.com/daedreth/UncleDavesEmacs
;; simulation keys are keys that exwm will send to the exwm buffer upon inputting a key combination
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


(defun exwm-async-run (name)
  (interactive)
  (start-process name nil name))

(defun daedreth/launch-discord ()
  (interactive)
  (exwm-async-run "discord"))

(defun daedreth/shutdown ()
  (interactive)
  (start-process "halt" nil "sudo" "halt"))

(global-set-key (kbd "<XF86PowerOff>") 'daedreth/shutdown)

;; Do not forget to enable EXWM. It will start by itself when things are
;; ready.  You can put it _anywhere_ in your configuration.



(exwm-enable)



(eval-after-load "org"
  '(require 'ox-gfm nil t))
;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-indent-line (quote none))

(ac-config-default)

(setq ac-auto-show-menu 0.8)

(add-to-list 'ac-dictionary-directories
	      "~/.emacs.d/elpa/auto-complete-20170124.1845/dict" )

(add-to-list 'ac-modes 'org-mode)

(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-dictionary
               ac-source-yasnippet nil
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic))

(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'js-mode-hook  'prettier-js-mode)
(setq prettier-js-args '("--parser" "babylon"))


  ;; Evil mode
  (require 'evil)
  (evil-mode 1)
  
  (setq evil-want-C-i-jump nil)

  ;; prevent esc-key from translating to meta-key in terminal mode
  (setq evil-esc-delay 0)

  (unless (display-graphic-p)
   (require 'evil-terminal-cursor-changer)
    (evil-terminal-cursor-changer-activate) ; or (etcc-on)
   )

;; working on  Konsole (xfc4 not working)
  (setq evil-motion-state-cursor 'box)  ; █
       (setq evil-visual-state-cursor 'box)  ; █
       (setq evil-normal-state-cursor 'box)  ; █
       (setq evil-insert-state-cursor 'bar)  ; ⎸
       (setq evil-emacs-state-cursor  'hbar) ; _

;; emacs -nw
;;(setq evil-want-C-i-jump nil)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" .org-mode))
;; The above is the default in recent emacsen

(setq org-pretty-entities t)

;; Fonts
(setq org-src-fontify-natively t)
;(setq org-src-tab-acts-natively t)

;; change bold color
(add-to-list 'org-emphasis-alist '("*" (:foreground "yellow")))

;; Bullets points

(use-package org-bullets
   :ensure t
   :init (add-hook 'org-mode-hook 'org-bullets-mode))

(setq org-bullets-bullet-list 
  '("◉" "▸" "▸" "▸" "▸" "▸" "▸" "▸" "▸" "▸"))

(use-package org
  :init
  (font-lock-add-keywords 'org-mode
   '(("^ +\\([-*]\\) "
          (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))))))

; '(org-export-backends (quote (ascii html icalendar latex md odt)))

 (setq org-link-frame-setup
   (quote
    ((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file-other-frame)
     (wl . wl-other-frame))))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(add-to-list 'org-src-lang-modes '("js2" . js2))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql   . t)
   (shell . t) 
   (js    . t)
   (dot   . t)))


;; Stop asking  confirmation to evaluate source code
(setq org-confirm-babel-evaluate nil)


;; babel tangle block
(defun org-babel-tangle-block()
  (interactive)
  (let ((current-prefix-arg '(4)))
     (call-interactively 'org-babel-tangle)))

(eval-after-load "org" 
  '(progn (define-key org-mode-map (kbd "C-c b") 'org-babel-tangle-block)))
;; org capture
(define-key global-map "\C-cc" 'org-capture)

;; %i Initial content,
;; the region when capture is called while the region is active.
;; The entire text will be indented like %i itself.
;; %?  After completing the template, position cursor here.

(defun capture-report-data-file (path)
  (let ((name (read-string "Name: ")))
    (expand-file-name (format "%s-%s.markdown" (format-time-string "%Y-%m-%d") name) path)))

(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "/home/erretres/Desktop/todo.org" "Tasks")
        "* TODO %?\n  %i\n  %a")
   ("e" "English word" entry (file+headline "/home/erretres/Desktop/new_notes/english.org" "words")
   "* word")
    ("p" "Jekyll post" plain(file (capture-report-data-file  "/home/erretres/Desktop/PORTFOLIO/final/_posts/") "_posts")
		"---\ntitle:\n---\n%?") 
     ("W" "Worklog" entry (file "/home/erretres/Desktop/worklog.org" )
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
#+TBLFM: @2$1=($3-$2);U::@3$1=($3-$2);U::@4$1=($3-$2);U::@5$1=($3-$2);U::@6$7=(@2$1+@3$1+@4$1+@5$1);U\n")))


(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
  (interactive)
  (insert (format-time-string "%H:%M" (current-time))))

(define-key org-mode-map "\C-ct" 'insert-current-time)
 ;; pomodoro
 (require 'pomodoro)
 (define-key global-map "\C-cp" 'pomodoro-start )
 (pomodoro-add-to-mode-line)
(setq org-pomodoro-length 25)
(setq org-pomodoro-play-sounds nil)

;; web-mode
;; Atomatically load web-mode when opening web-related files
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

;; Indentations
( defun my-web-mode-hook ()
"Hooks for Web mode."
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)
;(setq tab-width 2)

;; Highlight of columns
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)
;; eww background color
(setq shr-color-visible-luminance-min 70)

;; Auto-rename new eww buffers
(defun xah-rename-eww-hook ()
  "Rename eww browser's buffer so sites open in new page."
  (rename-buffer "eww" t))
   (add-hook 'eww-mode-hook #'xah-rename-eww-hook)

;; eww
(global-set-key (kbd "<f4>") (lambda() (interactive)(eww "https://forum.freecodecamp.org/c/project-feedback" )))

(global-set-key (kbd "<f5>") (lambda() (interactive)(eww "https://news.ycombinator.com/" ))) 
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Emmet settings
(add-hook 'web-mode-hook  'emmet-mode) 
(add-hook 'web-mode-before-auto-complete-hooks
	  '(lambda ()
	     (let ((web-mode-cur-language
		    (web-mode-language-at-pos)))
	       (if (string= web-mode-cur-language "css")
		   (setq emmet-use-css-transform t)
		 (setq emmet-use-css-transform nil)))))
;; Magit
(global-set-key (kbd "C-x m") 
 (lambda() 
  (interactive) 
   (magit-status) (evil-mode)))
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)
(pdf-tools-install)
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
; save and tangle 
(global-set-key (kbd "<f1>") 
  (lambda() 
    (interactive)
      (save-buffer)(org-babel-tangle-block)))
(load (expand-file-name "~/quicklisp/slime-helper.el"))
 ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "/usr/local/bin/sbcl")

;; orgmode save export to markdown  
(global-set-key (kbd "<f2>") 
  (lambda() 
     (interactive)
       (save-buffer) (org-gfm-export-to-markdown)))
;; orgmode save and export to html  
(global-set-key (kbd "<f3>") 
  (lambda() 
     (interactive)
       (save-buffer) (org-html-export-to-html)))
;; Always at the end
(setq-default ispell-program-name "aspell")
