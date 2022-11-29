
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-week-start-day 1)
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono" :foundry "1ASC" :slant normal :weight normal :height 113 :width normal))))
 '(flyspell-duplicate ((t (:underline (:color "dark violet" :style wave)))))
 '(flyspell-incorrect ((t (:underline (:color "magenta" :style wave)))))
 '(fringe ((t (:background "dim gray")))))

;; inverting colors
(invert-face 'default)

(eval-when-compile
  (require 'use-package))

(use-package avy
  :bind*
  ("C-;" . avy-goto-word-1)
  ("C-M-;" . avy-pop-mark)
  :ensure t)

(use-package company
  :bind
  ("C-<tab>" . company-complete)
  :config
  (global-company-mode)
  :ensure t)

(use-package projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode +1)
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package ccls
  :hook ((c-mode c++-mode) . (lambda () (require 'ccls) (lsp)))
  :ensure t)

(use-package lsp
  ;; ;; clangd backend config
  ;; :init
  ;; (setq lsp-clients-clangd-args '("--j=8"
  ;;                                 "--background-index"))
  :bind-keymap
  ("C-c l" . lsp-command-map)
  :bind
  (("M-," . 'lsp-find-references)
   ("M-." . 'lsp-find-definition)
   ("M-*" . 'xref-pop-marker-stack))
  :hook ((c-mode . lsp)
         (c++-mode . lsp)
         (python-mode . lsp)
         (latex-mode . lsp)
         (tex-mode . lsp)
         (texinfo-mode . lsp)))

;; ;; Maybe use in future
;; (use-package xref
;;   :bind
;;   (("M-." . xref-find-definitions)
;;    ("M-," . xref-find-references)
;;    ("M-*" . xref-pop-marker-stack)))

(use-package company-lsp
  :commands company-lsp)

(use-package yasnippet
  :hook ((latex-mode . yas-minor-mode)
         (prog-mode . yas-minor-mode))
  :ensure t)

(use-package yasnippet-snippets
  :ensure t)

(use-package scad-mode
  :ensure t)

(use-package ido
  :config
  (setq ido-enable-flex-matching t)
  (ido-mode t)
  :ensure t)

(use-package magit
  :config
  (setq magit-diff-refine-hunk t)
  :ensure t)

(use-package cmake-mode
  :ensure t)

(use-package ibuffer
  :bind
  ("C-x C-b" . 'ibuffer))

(use-package cua-base
  :config
  (cua-selection-mode t))               ;overwrite marked region

(use-package ispell
  :config
  (setq ispell-program-name "hunspell")
  (setq ispell-local-dictionary nil)
  (setq ispell-dictionary "english"))

(use-package dockerfile-mode
  :ensure t)

(use-package geiser
  :config
  (require 'geiser-mode)
  :ensure t)

;; use 'jar exec mode on some other systems
(use-package plantuml-mode
  :config
  (setq plantuml-default-exec-mode 'executable)
  (setq plantuml-server-url "")
  (setq plantuml-indent-level 2)
  :mode
  "\\.\\(puml\\|plantuml\\)\\'"
  :ensure t)

(use-package flyspell
  :hook ((prog-mode . flyspell-prog-mode)
         (org-mode . flyspell-mode)
         (text-mode . flyspell-mode)
         (markdown-mode . flyspell-mode))
  :ensure t)

(use-package yaml-mode
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;
;; general settings ;;
;;;;;;;;;;;;;;;;;;;;;;
(setq-default indent-tabs-mode nil)
(global-subword-mode)
;;(setq c-default-style "awk")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general keyboard mapping ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun prev-window ()
  (interactive)
  (other-window -1))

(bind-key* "C-." 'other-window)         ;this is overriding some flyspell bindings
(bind-key* "C-," 'prev-window)
(bind-key* "C-x C-n" 'next-buffer)
(bind-key* "C-x C-p" 'previous-buffer)
(bind-key* "C-c r" 'rgrep)              ;might be overriding a geiser binding
(bind-key* "C-c f" 'find-name-dired)
(bind-key "M-n" 'forward-paragraph)
(bind-key "M-p" 'backward-paragraph)

