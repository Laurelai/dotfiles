; NOTES:
; (ielm): inferior emacs lisp mode (repl)
; (eshell): can also act as a repl
; (lisp-interaction-mode): make the current buffer act as a repl
;

; require libraries
(require 'cl)		; some common lisp functions
(require 'tramp)
(require 'erc)
(require 'rcirc)
(require 'thingatpt)
(require 'ruby-mode)
(require 'ruby-electric)

(add-to-list 'load-path "/home/rm/emacs-extensions/muse/lisp")
(require 'muse-mode)
(require 'muse-html)
(require 'muse-latex)
(require 'muse-project)

; find slime
(add-to-list 'load-path "/home/rm/emacs-extensions/slime")
(require 'slime)

; disable splash screen at startup
(setq inhibit-splash-screen t)
; enable desktop save mode for session restoration
;(desktop-save-mode 1)
; turn on auto-indent
(setq indent-line-function 'indent-relative-maybe)

; configure timeclock
(setq timeclock-ask-before-exiting t)

; startup winner-mode
; (winner-mode 1)

(defun setup-slime ()
  "setup default slime interface"
  (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
  (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
  (slime-setup))
(setup-slime)

; setup abbreviations
; http://www.slac.stanford.edu/comp/unix/gnu-info/elisp_33.html
(setq default-abbrev-mode t)

; tramp defaults
;   /ssh:user@hostname#port:/path/to/file
;   /smb:user@windows-host:/path/to/file
;   C-x C-f /su::/etc/hosts RET
(setq tramp-default-user "rm")
(setq password-cache-expiry nil)

; select a color theme
(require 'color-theme)
;(color-theme-initialize)
(color-theme-matrix)

; join channels on erc start
(defun erc-setup ()
  (add-hook
   'window-configuration-change-hook 
   '(lambda ()
      (setq erc-fill-column (- (window-width) 2)))))

(defun erc-maybe ()
 "connect to IRC"
 (interactive)
 (when (y-or-n-p "IRC? ")
  (erc-setup)
  (setq erc-autojoin-channels-alist
   '(("freenode.net" "#chicken" "#lisp" "#emacs")))
  (erc :server "irc.freenode.net" :port 6667 :nick "glogic"))
 (sit-for 20))
;(erc-maybe)

(defun at-with-tag (tag)
  (interactive)
  (ansi-term "/bin/bash" tag))

;C-c C-j : switch to line mode
;C-c C-k : switch to char mode
(defun at ()
  "create an ansi-term supplying a name"
  (interactive)
  (at-with-tag (read-string "supply a tag for this terminal: ")))

(defun url-search (url term)
  "pass in a url and search term and perform concatenation and opening"
  (browse-url (concat url term)))

(defun interactive-url-search (url)
  "search a url interactively"
  (interactive)
  (url-search url (read-string "enter search term: ")))

(defun google ()
  "search google for a search term"
  (interactive)
  (interactive-url-search "http://www.google.com/search?q="))

(defun google-at-point ()
  "search google for term at current cursor position"
  (interactive)
  (url-search "http://www.google.com/search?q=" (thing-at-point 'word)))

(defun clone-emacs ()
  (interactive)
    (start-process "emacs-clone" "emacs-clone" "/Applications/Emacs.app/Contents/MacOS/Emacs" "-Q"))

(defun create-scratch-buffer nil
  "Create a scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))  

(defun window-setup ()
  (interactive)
  ;; full-screen frame settings
  (setq initial-frame-alist '((top . 0) (left . 0) (width . 360) (height . 85)))
  (setq default-frame-alist '((top . 0) (left . 0) (width . 360) (height . 85)))
  (setq special-display-frame-alist '((top . 0) (left . 0) (width . 360) (height . 85)))
  (switch-to-buffer-other-frame (buffer-name))
  ;; create windows as needed
  (delete-other-windows) 
  (split-window-vertically)
  (switch-to-buffer "*scratch*")
  (split-window-horizontally) 
  (other-window 1)
  (find-file "~/.emacs")
  (split-window-horizontally) 
  (switch-to-buffer "*Messages*")
  (other-window 2)
  (split-window-horizontally)
  (switch-to-buffer "*scratch*")
  (split-window-horizontally)
  (switch-to-buffer "*scratch*")
  (other-window 2)
  (split-window-horizontally)
  (switch-to-buffer "#lisp")
  (split-window-horizontally)
  (switch-to-buffer "#chicken")
  (other-window 2)
  (switch-to-buffer "irc.freenode.net:6667")
  (split-window-horizontally)
  (switch-to-buffer "#emacs")
  (set-frame-parameter nil 'alpha 85)
  (menu-bar-mode 0)
  (tool-bar-mode 0)
  (color-theme-blue-sea))
;(window-setup)

; ruby-mode
(defun ruby-eval-buffer () (interactive)
  "Evaluate the buffer with ruby."
  (shell-command-on-region (point-min) (point-max) "ruby"))

(defun my-ruby-mode-hook ()
  (font-lock-mode t)
  (setq standard-indent 2)
  (pabbrev-mode t)
  (ruby-electric-mode t)
  (define-key ruby-mode-map "\C-c\C-a" 'ruby-eval-buffer))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

; comment out a block of lisp code
(fset 'lisp-block-comment
   ";\C-a\C-n")

; create a ruby header
(fset 'ruby-header
   [escape ?< ?# ?! ?/ ?u ?s ?r ?/ ?b ?i ?n ?/ ?e ?n ?v ?  ?r ?u ?b ?y return])

; create an env header
(fset 'env-header
   [escape ?< ?# ?! ?/ ?u ?s ?r ?/ ?b ?i ?n ?/ ?e ?n ?v ? ])

; uncomment block
(fset 'uncomment-block
   [?\C-a delete ?\C-n ?\C-a])

; used for reformatting yaml blocks
(fset 'shift-left-two-spaces
   [delete delete ?\C-n])

; macro to indent an entire file based on current mode
(fset 'indent-entire-file
      [?\C-x ?h escape ?x ?i ?n ?d ?e ?n ?t ?- ?r ?e ?g ?i ?o ?n return])

; set global keys
(global-set-key [(control c) (control w)] 'browse-url)
(global-set-key [(control c) (control c)] 'lisp-block-comment)
(global-set-key [(control c) (control u)] 'uncomment-block)
(global-set-key [(control c) (control s)] 'create-scratch-buffer)
(global-set-key [(control c) (control p)] 'google-at-point)
(global-set-key [(control c) (control g)] 'google)
(global-set-key [(control c) (control e)] 'eval-region)
(global-set-key [(control c) (control h)] 'env-header)
(global-set-key [(control c) (control b)] 'browse-url-at-point)
(global-set-key [(control c) (control i)] 'timeclock-in)
(global-set-key [(control c) (control o)] 'timeclock-out)
(global-set-key [(control c) (control r)] 'revert-buffer)
(global-set-key [(control c) (control v)] 'timeclock-visit-timelog)
(global-set-key [(control c) (control f)] 'window-setup)
(global-set-key [(control c) (control l)] 'shift-left-two-spaces)
;(global-set-key [(control a) (control n)] 'next-multiframe-window)
;(global-set-key [(control a) (control p)] 'previous-multiframe-window)
(global-set-key [(control -)] 'indent-sexp)
(global-set-key [(control =)] 'indent-region)
(global-set-key [(control \\)] 'indent-entire-file)

(defun reset-special-buffers ()
  "set all special buffer's to nil"
  (setq same-window-buffer-names '())
  (setq special-display-buffer-names '())
  (setq same-window-regexps '())
  (setq special-display-regexps '()))
(reset-special-buffers)
; send all special buffers to the current window
(setq same-window-regexps '("*.*"))
