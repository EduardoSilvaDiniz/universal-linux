;; Configuração basica do Emacs
(setq inhibit-startup-message t)     ; Remove buffer de boas vindas do emacs

(tool-bar-mode   -1)                 ; Oculta a Barra de ferramentas
(menu-bar-mode   -1)                 ; Oculta a barra de menu
(scroll-bar-mode -1)                 ; Oculta a barra de rolagem
(tooltip-mode    -1)                 ; Oculta dicas

(global-display-line-numbers-mode t) ; Exibe numeração de linhas
(column-number-mode t)               ; Exibe coluna atual no modeline
(global-hl-line-mode t)              ; Exibe destaque de linha

;; Alertas visuais
(setq visible-bell t)

;; Espaçamento das bordas laterais
(set-fringe-mode 10)
 
;; Ajustes para a minha sanidade mental
(global-unset-key (kbd "C-z"))         ; Desabilita Ctrl-z (suspend frame)
(delete-selection-mode t)              ; O texto digitado substitui a seleção

;; Rolagem mais suave
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1)) ; 2 linha por vez
      mouse-wheel-progressive-speed nil            ; Não acelera a rolagem
      mouse-wheel-follow-mouse 't                  ; Rola a janela sob o mouse
      mouse-step 1)                                ; Rola 1 linha com teclado

;; Quebra de linha
(global-visual-line-mode t)

;; Definição de tema, fonte
(load-theme 'gruvbox t)
(set-face-attribute 'default nil :font "JetBrainsMono" :height 120)

;; Tipo de cursor (box, bar ou hbar)
(setq-default cursor-type 'box)

;; Organizando os backups, define um dir para salvar backups dos buffers
(setq backup-directory-alist '(("." . "/home/edu/.saves")))

;; verifica e inicia package.el
(require 'package)

;; Definição de repositorio
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("olg"   . "https://orgmode.org/elpa/")
			 ("elpa"  . "https://elpa.gnu.org/packages/")))

;; Inicialização do sistema de pacotes
(package-initialize)
(unless package-archive-contents
    (package-refresh-contents))

;; Instalação do use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Instalação do auto-update
(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "21:00"))

;; Instalação do tema gruvbox
(use-package gruvbox-theme)

;; Instalação do autocompletion
(use-package jedi)
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(elpy pyvenv jedi auto-complete auto-complete-extension\.el gruvbox-theme auto-package-update use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
