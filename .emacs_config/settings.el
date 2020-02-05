(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 150) ;; 130 = 13pt font
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(setq custom-safe-themes
   (quote       ("a77ced882e25028e994d168a612c763a4feb8c4ab67c5ff48688654d0264370c" default)))
(load-theme 'soothe)
(custom-set-faces
 '(org-hide ((t (:background "#110F13" :foreground "#110F13"))))
 ;'(font-lock-comment-face ((t (:background "#110F13" :foreground "#7868B5" :slant italic))))
)

(setq display-time-day-and-date t)
(display-time-mode t)

(column-number-mode t)

(require 'company)
(global-company-mode t)
(require 'ido)
(ido-mode t)

(setq ispell-program-name "/usr/bin/aspell")
(add-hook 'org-mode-hook 'flyspell-mode)

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
                           
;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
;;(setq backup-directory-alist '(("." . (concat user-emacs-directory "backup"))))

(global-set-key (kbd "C-c b") 'bookmark-jump)

(setq ispell-personal-dictionary (expand-file-name ".ispell_pdict" (file-name-directory user-init-file)))

(require 'helm)
(helm-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(setq initial-buffer-choice t)

(require 'dired)
(define-key dired-mode-map (kbd "C-<up>") 'dired-up-directory)
;;(global-set-key (kbd "s-r") 'beginning-of-line)
;;(global-set-key (kbd "C-f") 'forward-word)
;;(global-set-key (kbd "C-b") 'backward-word)
;;(global-set-key (kbd "M-f") 'sp-forward-sexp)
;;(global-set-key (kbd "M-b") 'sp-backward-sexp)
;;(global-set-key (kbd "M-p") 'sp-up-sexp)
;;(global-set-key (kbd "M-n") 'sp-down-sexp)
;;(global-set-key (kbd "M-P") 'sp-backward-up-sexp)
;;(global-set-key (kbd "M-N") 'sp-backward-down-sexp)

(defun my-commands () (interactive)
       (setq unread-command-events (listify-key-sequence "my-"))
       (call-interactively 'helm-M-x))
(global-set-key (kbd "M-X") 'my-commands)

(defun my-transparency () (interactive)
       (let ((b (- (read-key "Set transparency value [0-9]") 48)))
	 (if (< b 10) (set-frame-parameter (selected-frame) 'alpha (- 100 (* b 4))))))
(set-frame-parameter (selected-frame) 'alpha 100)
(global-set-key (kbd "C-c t") 'my-transparency)

(defun my-comment-or-uncomment () (interactive)
       (if (region-active-p)
	   (call-interactively 'comment-or-uncomment-region)
	 (comment-or-uncomment-region (point-at-bol) (point-at-eol))))
(global-set-key (kbd "C-c ;") 'my-comment-or-uncomment)

(require 'org-journal)
(defun insert-time () "Insert the current 24h time in HH:MM format" (interactive)
      (let ((arr (split-string (current-time-string) ":")))
	 (insert (concat (substring (first arr) -2) ":" (nth 1 arr)))))
(defun insert-time-heading () "Insert time as new org heading" (interactive)
       (org-insert-heading-respect-content)
       (insert-time)
       (org-beginning-of-line)
       (set-mark (point))
       (sp-backward-whitespace)
       (org-delete-backward-char 1)
       (org-return)
       (org-return)
       (org-end-of-line)
       (org-return))
(define-key org-mode-map (kbd "C-c RET") 'insert-time-heading)

(define-key org-mode-map (kbd "C-c s") (lambda () (interactive) (beginning-of-buffer) (setq unread-command-events (listify-key-sequence "p")) (org-sort) (org-shifttab)))

(defun org-journal-new-entry-filename () (interactive)
       (call-interactively 'org-journal-new-entry)
       (previous-line)
       (beginning-of-line)
       (kill-line)
       (kill-line)
       (buffer-file-name)
       )

(defun pdict-add () "Add current word to dictionary" (interactive)
	 (setq unread-command-events (listify-key-sequence "iy"))
	 (if (not (flyspell-check-previous-highlighted-word))
	     (setq unread-command-events (listify-key-sequence ""))))
(define-key org-mode-map (kbd "C-c d") 'pdict-add)

(global-set-key (kbd "C-c m") 'minimap-mode)
(setq unread-command-events (listify-key-sequence "\C-cm"))

(require 'org)

(setq org-return-follows-link t)
(global-set-key (kbd "C-c l") 'org-store-link)

(define-key org-journal-mode-map (kbd "C-c <right>") 'insert-time-heading-demote)
(define-key org-journal-mode-map (kbd "C-c <left>") 'insert-time-heading-promote)

(defun insert-time-heading-demote () "" (interactive)
       (insert-time-heading)
       (org-demote-subtree))

(defun insert-time-heading-promote () "" (interactive)
       (insert-time-heading)
       (org-promote-subtree))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-directory "~/Dropbox/org")

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-hide-emphasis-markers t)

(setq org-ellipsis "▾")

(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-bullets-bullet-list (quote ("→")))

(require 'htmlize)

(global-set-key (kbd "C-c P") (lambda () "" (interactive) (org-publish-all t)))
(setq org-publish-project-alist
      '(
	("orgsite-html"
	 :base-directory "~/Dropbox/org/"
	 :base-extension "org"
;;	 :publishing-directory "~/Documents/orgsite/"
	 :publishing-directory "/run/user/1000/gvfs/smb-share:server=warehouse14.local,share=e_drive/_Working Cole/org/"
	 :recursive nil
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 :auto-sitemap t
	 :sitemap-sort-folders ignore)))

(defun toggle-org-publish-on-save ()
  (interactive)
  (if (memq 'org-publish-all after-save-hook)
      (progn
        (remove-hook 'after-save-hook 'org-publish-all t)
        (message "Disabled org publish on save for current buffer..."))
    (add-hook 'after-save-hook 'org-publish-all nil t)
    (message "Enabled org publish on save for current buffer...")))
(global-set-key (kbd "C-c p") 'toggle-org-publish-on-save)

(require 'org-journal)
(global-set-key (kbd "C-c j") 'org-journal-new-entry)
(global-set-key (kbd "C-c J") (lambda () "" (interactive) (org-journal-new-entry t) (read-only-mode)))
(setq org-journal-dir "~/Dropbox/journal") ;; needed in customize
(setq org-journal-file-format "%Y%m%d.org")

(require 'org-protocol)
(add-to-list 'load-path (concat user-emacs-directory "elpa/org-9.2.5/org-protocol.el"))
(server-start)

(require 'ox-org)
(require 'cl) ;; this fixed export problem, not sure why     
(load (concat user-emacs-directory "elpa/org-mind-map-20180826.2340/org-mind-map.el"))
(org-mind-map-make-node-fn default "Makes a plain box node without double borders" nil "box")

(setq org-mind-map-node-formats (quote (("default" . org-mind-map-default-node))))

(setq package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))

(smartparens-global-mode t)
(show-smartparens-global-mode t)
(define-key smartparens-mode-map (kbd "C-S-<left>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-S-<right>") 'sp-forward-slurp-sexp)
(setq sp-use-subword t)

(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
(sp-local-pair '(org-mode tex-mode) "$" "$")
(sp-local-pair '(org-mode tex-mode) "\\textit{" "}" :insert "C-S-i")
(sp-local-pair '(org-mode tex-mode) "\\textbf{" "}" :insert "C-S-b")
;;(sp-local-pair '(org-mode tex-mode) "\\left(" "\\right)" :insert "C-c l")
;;(sp-local-pair '(org-mode tex-mode) "\\left[" "\\right]" :insert "C-c L")
(sp-local-pair '(java-mode) "System.out.println(" ")" :trigger "syso")

(toggle-word-wrap)
(add-hook 'org-mode-hook 'visual-line-mode)

(require 'visual-fill-column)
(add-hook 'visual-line-mode-hook 'visual-fill-column-mode)

(global-set-key (kbd "C-!") 'shell)

(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)
