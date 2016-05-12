;; Use key arrow for navigation
(setq prelude-guru nil)

;;

(global-unset-key (vector (list 'shift 'left)))
(global-unset-key (vector (list 'shift 'right)))
(global-unset-key (vector (list 'shift 'up)))
(global-unset-key (vector (list 'shift 'down)))


(global-unset-key (kbd "C-x <left>"))
(global-unset-key (kbd "C-x <right>"))
(global-unset-key (kbd "C-x <up>"))
(global-unset-key (kbd "C-x <down>"))


(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <down>")  'windmove-down)


(setq shift-selection-mode t)

;; Keybindings
(keyboard-translate ?\C-u ?\C-x)
(keyboard-translate ?\C-u ?\C-x)

(setq ns-command-modifier (quote meta))
(setq mac-option-modifier nil)
(setq locate-command "mdfind")

(global-unset-key (kbd "M-v"))
(global-unset-key (kbd "M-c"))
(global-unset-key (kbd "M-a"))
;;(global-unset-key (kbd "M-x"))


(define-key global-map (kbd "M-v") 'yank)
(define-key global-map (kbd "M-c") 'ns-copy-including-secondary)
(define-key global-map (kbd "M-a") 'mark-whole-buffer)
(define-key global-map (kbd "M-q") 'kill-region)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-d") 'duplicate-line)

;; TCL mode
(setq tcl-indent-level 2)
(setq tcl-continued-indent-level 2)



;;https://unix.stackexchange.com/questions/29786/font-size-issues-with-emacs-in-linum-mode/30087#30087
(require 'linum)
(defun linum-update-window-scale-fix (win)
  "fix linum for scaled text"
  (set-window-margins win
                      (ceiling (* (if (boundp 'text-scale-mode-step)
                                      (expt text-scale-mode-step
                                            text-scale-mode-amount) 1)
                                  (if (car (window-margins))
                                      (car (window-margins)) 1)
                                  ))))
(advice-add #'linum-update-window :after #'linum-update-window-scale-fix)

;; Map escape to cancel (like C-g)...
(define-key isearch-mode-map [escape] 'isearch-abort)   ;; isearch
(define-key isearch-mode-map "\e" 'isearch-abort)   ;; \e seems to work better for terminals
(global-set-key [escape] 'keyboard-escape-quit)         ;; everywhere else
