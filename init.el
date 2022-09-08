(require 'package)
(require 'cl-lib)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; probably not a good idea cause updates but oh well -9/8/2022
(unless package-archive-contents
  (package-refresh-contents))

(setq package-list
  '(evil general helm undo-tree slime shackle fzf evil-surround))

;; Download Packages that aren't already installed
(mapcar 'package-install (cl-remove-if 'package-installed-p package-list))


;; bunch of random config stuff, self documented
(setq evil-want-C-u-scroll t)
(global-undo-tree-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
;;(load-theme deeper-blue)


;; Enable Evil
(require 'evil)
(require 'general)
(require 'helm)
(require 'slime)
(require 'shackle)
(require 'fzf)
(require 'paredit)
(require 'evil-surround)

(evil-mode 1)
(shackle-mode 1)

;; more toggles
(evil-set-undo-system 'undo-tree)
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :ratio 0.4)))
(general-evil-setup)

(global-evil-surround-mode 1)


(general-define-key
  :prefix "SPC"
  :states '(normal visual)

  "SPC" 'helm-M-x

  ;; some top layer stuff
  "'"  'shell

  ;; window
  "wh" 'evil-window-left
  "wl" 'evil-window-right
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  "wv" 'evil-window-vsplit
  "ws" 'evil-window-split
  "wd" 'evil-window-delete

  ;; file
  "fs"  'save-buffer
  "fj"  'fzf
  "fd"  'dired
  "f/"  'fzf-grep
  "fed" '(lambda () (interactive) (find-file "~/.emacs.d/init.el"))

  ;; project
  "pj" 'fzf-git
  "p/" 'fzf-git-grep

  ;; buffer
  "bb" 'helm-mini
  "bp" 'previous-buffer
  "bn" 'next-buffer

  ;; lisp stuff
  ;;"kw" 'paredit-wrap-round

  ;; comment
  "cl" 'comment-line

  ;; alignment
  "aa" 'align
  "ae" 'align-entire
  )

;; lisp modes bindings, hopefully

(general-nmap
  :keymaps 'emacs-lisp-mode-map
  :states  '(normal visual)
  :prefix ","
  "eb" 'eval-buffer
  "er" 'eval-region
  "ef" 'eval-defun
  )

;; common lisp stuff from spacemacs
(general-nmap
  :keymaps 'lisp-mode-map
  :states '(normal visual)
  :prefix ","
  "'" 'slime
  "cc" 'slime-compile-file
  "cC" 'slime-compile-and-load-file
  "cl" 'slime-load-file
  "cf" 'slime-compile-defun
  "cr" 'slime-compile-region
  "cn" 'slime-remove-notes

  "eb" 'slime-eval-buffer
  "ef" 'slime-eval-defun
  "eF" 'slime-undefine-function
  "ee" 'slime-eval-last-expression
  "el" 'spacemacs/slime-eval-sexp-end-of-line
  "er" 'slime-eval-region

  "gb" 'slime-pop-find-definition-stack
  "gn" 'slime-next-note
  "gN" 'slime-previous-note

  "ha" 'slime-apropos
  "hA" 'slime-apropos-all
  "hd" 'slime-disassemble-symbol
  "hh" 'slime-describe-symbol
  "hH" 'slime-hyperspec-lookup
  "hi" 'slime-inspect-definition
  "hp" 'slime-apropos-package
  "ht" 'slime-toggle-trace-fdefinition
  "hT" 'slime-untrace-all
  "h<" 'slime-who-calls
  "h>" 'slime-calls-who

  "hr" 'slime-who-references
  "hm" 'slime-who-macroexpands
  "hs" 'slime-who-specializes

  "ma" 'slime-macroexpand-all
  "mo" 'slime-macroexpand-1

  "sc" 'slime-connect
  "se" 'slime-eval-last-expression-in-repl
  "si" 'slime
  "sq" 'slime-quit-lisp

  "tf" 'slime-toggle-fancy-trace
  )



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-surround paredit parenedit fzf shackle slime undo-tree helm general evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


