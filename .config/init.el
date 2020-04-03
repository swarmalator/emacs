(setq user-init-file (or load-file-name (buffer-file-name)))
(setq home-directory (if
			 (string-equal system-type "windows-nt")
			 (concat "C:/Users/" user-login-name)
		       "~"))
(setq user-emacs-directory (concat
			    home-directory
			    "/Documents/Emacs/.emacs.d/"))
(setq os-directory (concat user-emacs-directory "." (replace-regexp-in-string "/" "-" (symbol-name system-type)) "/"))


(require 'package)
(package-initialize)
(require 'use-package)
(require 'org-crypt)
(require 'org)
(require 'htmlize)
(org-babel-load-file
 (expand-file-name "settings.org" (file-name-directory user-init-file)))
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-names-vector
   ["#110F13" "#B13120" "#719F34" "#CEAE3E" "#7C9FC9" "#7868B5" "#009090" "#F4EAD5"])
 '(auto-save-default nil)
 '(bookmark-default-file (concat os-directory "bookmarks"))
 '(custom-enabled-themes (quote (northcode)))
 '(custom-safe-themes
   (quote
    ("10a31b6c251640d04b2fa74bd2c05aaaee915cbca6501bcc82820cdc177f5a93" "2f4f50d98073c01038b518066840638455657dc91dd1a225286d573926f36914" "a77ced882e25028e994d168a612c763a4feb8c4ab67c5ff48688654d0264370c" "5ac259a7a0a0d2b541199480c58510b4f9f244e810da999d3f22d5e3bb0ad208" "fd3b1531faea72f67620800a332e790f9f67b04412ef335c396971fc73bee24b" "06589250ab29513fe389b36799d709686ace3598ff24987e8ecc89e529470fa5" default)))
 '(elpy-get-info-from-shell-timeout 2)
 '(elpy-rpc-python-command "python3")
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#202020")
 '(fill-column 200)
 '(flyspell-delay 0)
 '(flyspell-delayed-commands (quote (org-self-insert-command)))
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(fringe-mode 4 nil (fringe))
 '(global-linum-mode nil)
 '(hacker-typer-show-hackerman t)
 '(hacker-typer-type-rate 20)
 '(helm-completion-style (quote emacs))
 '(js-indent-level 2)
 '(kmacro-call-repeat-key 101)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(minimap-automatically-delete-window nil)
 '(minimap-major-modes (quote (prog-mode artist-mode)))
 '(minimap-mode t)
 '(minimap-window-location (quote right))
 '(openwith-associations
   (quote
    (("\\.pdf\\'" "evince"
      (file))
     ("\\.mp3\\'" "xmms"
      (file))
     ("\\.\\(?:mpe?g\\|avi\\|wmv\\)\\'" "mplayer"
      ("-idx" file))
     ("\\.\\(?:jp?g\\|png\\)\\'" "display"
      (file))
     ("html" "chromium"
      (file))
     ("sh" "sh"
      (file)))))
 '(openwith-mode nil)
 '(org-adapt-indentation nil)
 '(org-agenda-files
   (quote
    ("/home/cole/Dropbox/org/capture.org" "/home/cole/Dropbox/org/cascade.org" "/home/cole/Dropbox/org/controller.org" "/home/cole/Dropbox/org/erik.org" "/home/cole/Dropbox/org/file.org" "/home/cole/Dropbox/org/filemaker.org" "/home/cole/Dropbox/org/admin.org" "/home/cole/Dropbox/org/isaac.org" "/home/cole/Dropbox/org/john.org" "/home/cole/Dropbox/org/misc.org" "/home/cole/Dropbox/org/newuser.org" "/home/cole/Dropbox/org/newuser_old.org" "/home/cole/Dropbox/org/questions.org" "/home/cole/Dropbox/org/sigma.org" "/home/cole/Dropbox/org/site.org" "/home/cole/Dropbox/org/sitemap.org")))
 '(org-agenda-show-future-repeats nil)
 '(org-agenda-todo-ignore-scheduled (quote future))
 '(org-archive-mark-done nil)
 '(org-babel-tangle-lang-exts
   (quote
    (("emacs-lisp" . "el")
     ("elisp" . "el")
     ("python" . "py"))))
 '(org-capture-bookmark nil)
 '(org-capture-templates
   (quote
    (("s" "SITE" entry
      (file "~/Dropbox/org/site.org")
      "* TODO %?")
     ("e" "ERIK" entry
      (file "~/Dropbox/org/erik.org")
      "* TODO %?")
     ("m" "MISC" entry
      (file "~/Dropbox/org/misc.org")
      "* TODO %?")
     ("f" "FILEMAKER" entry
      (file "~/Dropbox/org/filemaker.org")
      "* TODO %?")
     ("p" "CONTROLLER" entry
      (file "~/Dropbox/org/controller.org")
      "* TODO %?")
     ("c" "CASCADE" entry
      (file "~/Dropbox/org/cascade.org")
      "* TODO %?")
     ("i" "ISAAC" entry
      (file "~/Dropbox/org/isaac.org")
      "* TODO %?")
     ("a" "ADMIN" entry
      (file "~/Dropbox/org/admin.org")
      "* TODO %?"))))
 '(org-crypt-key "E9AADC49E94A672D1A07D49B208FCDBB98190562")
 '(org-default-priority 70)
 '(org-export-with-priority t)
 '(org-fontify-emphasized-text t)
 '(org-highest-priority 65)
 '(org-journal-dir (concat home-directory "/Dropbox/journal/"))
 '(org-journal-enable-agenda-integration t)
 '(org-journal-file-format "%Y%m%d.org")
 '(org-journal-find-file (quote find-file))
 '(org-journal-hide-entries-p t)
 '(org-journal-time-format "%R")
 '(org-latex-compiler "lualatex")
 '(org-latex-pdf-process
   (quote
    ("%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f")))
 '(org-load-modules-maybe t)
 '(org-log-done nil)
 '(org-lowest-priority 70)
 '(org-mind-map-default-edge-attribs (quote (("dir" . "none"))))
 '(org-mind-map-default-graph-attribs
   (quote
    (("autosize" . "false")
     ("size" . "9,12")
     ("resolution" . "100")
     ("nodesep" . "0.75")
     ("overlap" . "false")
     ("spline" . "true")
     ("rankdir" . "LR"))))
 '(org-mind-map-default-node-attribs (quote (("shape" . "plaintext"))))
 '(org-mind-map-engine "neato")
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-eww org-gnus org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-priority-faces
   (quote
    ((70 . "blue")
     (69 . "purple")
     (68 . "red")
     (67 . "cyan")
     (66 . "yellow")
     (65 . "green"))))
 '(org-src-fontify-natively t)
 '(org-src-preserve-indentation t)
 '(org-src-tab-acts-natively t)
 '(org-startup-indented t)
 '(org-tags-column 0)
 '(org-tags-exclude-from-inheritance (quote ("crypt")))
 '(org-todo-keyword-faces
   (quote
    (("WIP" . font-lock-negation-char-face)
     ("PLAN" . font-lock-keyword-face))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "WIP(w)" "DONE(d@)")
     (sequence "PLAN(p)" "|"))))
 '(package-selected-packages
   (quote
    (use-package overcast-theme mandm-theme org-ehtml web-server org-noter hacker-typer company-tern tern tide js-react-redux-yasnippets typescript-mode magit py-autopep8 flycheck elpy org-brain twittering-mode heroku-theme northcode-theme haskell-mode visual-fill-column soothe-theme smartparens org-mind-map org-journal org-bullets helm company)))
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(python-shell-interpreter "python3")
 '(ring-bell-function (quote ignore))
 '(vc-annotate-background "#000000000000")
 '(vc-annotate-color-map
   (quote
    ((20 . "#ebf122411a75")
     (40 . "#EE3932")
     (60 . "#FF7509")
     (80 . "#e047d4d80000")
     (100 . "#efa3e36c0000")
     (120 . "#FFF200")
     (140 . "#4355c7106ffd")
     (160 . "#57CD7F")
     (180 . "#62ccd08f8801")
     (200 . "#6e99d41e9103")
     (220 . "#7676d67e9704")
     (240 . "#8632db3da306")
     (260 . "#93E0E3")
     (280 . "#00d857c4898e")
     (300 . "#00f864c09de9")
     (320 . "#014f8877d5e3")
     (340 . "#0be6a625fe7f")
     (360 . "#DDA0DD"))))
 '(vc-annotate-very-old-color "#DDA0DD"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((t (:background "black")))))
(put 'scroll-left 'disabled nil)
