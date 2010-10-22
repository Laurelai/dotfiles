; NOTES:
; (ielm): inferior emacs lisp mode (repl)
; (eshell): can also act as a repl
; (lisp-interaction-mode): make the current buffer act as a repl

; require libraries
(require 'cl)		; some common lisp functions
(require 'tramp)

; load slime
; setup slime 
(let ((slime-helper-file (expand-file-name "~/quicklisp/slime-helper.el")))
  (if (file-exists-p slime-helper-file)
      (progn
	(load slime-helper-file)
	(require 'slime)
	(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
	(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
	(slime-setup '(slime-repl)))))


; disable splash screen at startup
(setq inhibit-splash-screen t)

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
(color-theme-initialize)
(color-theme-taming-mr-arneson)

;C-c C-j : switch to line mode
;C-c C-k : switch to char mode
(defun at-with-tag (tag)
  (interactive)
  (ansi-term "/bin/bash" tag))

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

(defun create-scratch-buffer nil
  "Create a scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))  

; set global keys
(global-set-key [(control c) (control w)] 'browse-url)
(global-set-key [(control c) (control s)] 'create-scratch-buffer)
(global-set-key [(control c) (control g)] 'google)
(global-set-key [(control c) (control a)] 'at)
