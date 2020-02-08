;;; begin setup file
(require 'org)
(require 'ox-html)
(require 'ox-latex)
(require 'ox-publish)
(require 'ox-org)
(require 'org-ref)
(require 'org-bullets)
(require 'company)
(require 'tex-mode)
(require 'dired)
(require 'helm)
(require 'smartparens)
(require 'haskell-mode)
(require 'ispell)
(require 'flyspell)

;;; functions & commands
(defun my-alpha (b) (interactive "P")
       (set-frame-parameter (selected-frame) 'alpha (if b (+ (* b 5) 50) 100)))
(defun my-clean-lines () (interactive)
       (replace-string "" "" nil 0 (buffer-size) nil))

;; (defun my-explorer () (interactive)
;;        (shell-command (concat "explorer " (replace-regexp-in-string "/" "\\" default-directory t t))))

(defun my-M-x () (interactive)
       (setq unread-command-events (listify-key-sequence "my-"))
       (call-interactively 'helm-M-x))
(defun my-org-macro-insert () (interactive)
       (setq unread-command-events (listify-key-sequence "{{{")))
(defun my-comment-or-uncomment () (interactive)
       (if (region-active-p)
	   (call-interactively 'comment-or-uncomment-region)
	 (comment-or-uncomment-region (point-at-bol) (point-at-eol))))
(defun skewer-html-compute-tag-ancestry ()
  "Compute the ancestry chain at point."
  (skewer-html--with-html-mode
    (nreverse
     (cl-loop for tag in (skewer-html--get-context)
              for nth = (skewer-html-compute-tag-nth (1+ (sgml-tag-start tag)))
              for name = (skewer-html--cleanup tag)
              ;;unless (equal name "html")
              collect (list name nth)))))

;;; some minor mode hooks
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'dired-mode-hook 'openwith-mode)
;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'visual-line-mode-hook 'visual-fill-column-mode)
;;(add-hook 'js2-mode-hook 'skewer-mode)
;;(add-hook 'css-mode-hook 'skewer-css-mode)
;;(add-hook 'html-mode-hook 'skewer-html-mode)

;;; some smartparens pairs
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
(sp-local-pair '(org-mode tex-mode) "$" "$")
(sp-local-pair '(org-mode tex-mode) "\\textit{" "}" :insert "C-S-i")
(sp-local-pair '(org-mode tex-mode) "\\textbf{" "}" :insert "C-S-b")
(sp-local-pair '(org-mode tex-mode) "\\left(" "\\right)" :insert "C-c l")
(sp-local-pair '(org-mode tex-mode) "\\left[" "\\right]" :insert "C-c L")
(sp-local-pair '(java-mode) "System.out.println(" ")" :trigger "syso")

;;; keybindings

;; keys reserved for the user:
;; "C-c /letter/"
;; <F5> through <F9> (without modifier keys)
;; "C-" or "M-" folllowed by /digit/ (overwrites digit-argument, use C-u instead)
;; <apps> key (Windows-specific)

;; some global keys
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-X") 'my-M-x)
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-b") 'backward-word)

(global-set-key (kbd "C-c b") 'bookmark-jump)
;; (global-set-key (kbd "C-c e") 'my-explorer)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c m") 'minimap-mode)
(global-set-key (kbd "C-c p") 'org-publish-project)
(global-set-key (kbd "C-c P") 'org-publish-all)
(global-set-key (kbd "C-c ;") 'my-comment-or-uncomment)

(global-set-key (kbd "C-c j n") 'org-journal-new-entry)
(global-set-key (kbd "C-c j o") (lambda () "" (interactive) (org-journal-new-entry t) (read-only-mode)))

;; one haskell key (hoogle search)
(define-key haskell-mode-map (kbd "C-c h") 'hoogle)

;; some smartparens keys
(define-key smartparens-mode-map (kbd "M-f") 'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "M-b") 'sp-backward-sexp)
(define-key smartparens-mode-map (kbd "M-p") 'sp-up-sexp)
(define-key smartparens-mode-map (kbd "M-n") 'sp-down-sexp)
(define-key smartparens-mode-map (kbd "M-P") 'sp-backward-up-sexp)
(define-key smartparens-mode-map (kbd "M-N") 'sp-backward-down-sexp)
(define-key smartparens-mode-map (kbd "C-S-<left>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-S-<right>") 'sp-forward-slurp-sexp)

(define-key org-mode-map (kbd "C-{") 'my-org-macro-insert)


;; turn on helm minor mode
(helm-mode t)

;; initialize frame transparency as an integer (instead of cons list for active/inactive alphas)
(set-frame-parameter (selected-frame) 'alpha 100)

;; send all file backups to the backup folder so I don't have to clean so many directories
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

;; initializes org pdf export with pdflatex
(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
	"bibtex %b"
	"pdflatex -interaction nonstopmode -output-directory %o %f"
	"pdflatex -interaction nonstopmode -output-directory %o %f"))

;; adds spell checker to the exec-path (since this is a windows computer)
;; (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")

;; (setq ispell-personal-dictionary "C:/Program Filesx(x86)/Aspell/dict")

;;org to HTML website publishing setup
(setq org-publish-project-alist
      '(
	("org-html"
	 :base-directory "~/Documents/web/src"
	 :base-extension "org"
	 :publishing-directory "~/Documents/web/html"
	 :recursive nil
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 :auto-sitemap t
	 :sitemap-sort-folders ignore)
	("org-resources"
	 :base-directory "~/Documents/web/src" 
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/Documents/web/html"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("org-journal"
	 :base-directory "~/Documents/journal/"
	 :base-extension "org"
	 :publishing-directory "~/Documents/web/html/journal" 
	 :recursive nil
	 :publishing-function org-publish-attachment
	 )))


(setq ispell-program-name "/usr/bin/hunspell")

(load "/home/colet/.emacs.d/elpa/org-mind-map-20180826.2340/org-mind-map.el")

(org-mind-map-make-node-fn default "Makes a plain box node without double borders" nil "box")
(setq org-mind-map-node-formats (quote (("default" . org-mind-map-default-node))))

(defun my-omm-view ()
  "view org-mind-map diagram"
  (interactive)
  (find-file (concat (substring buffer-file-name 0 -4) "_diagram.pdf")))

(defun my-omm-make ()
  "Make and view org-mind-map"
  (interactive)
  (org-mind-map-write nil)
  (my-omm-view))
