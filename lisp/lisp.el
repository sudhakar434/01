;;; BASICS

;; assign value to a symbol
(set 'version "24.3")

;; assign value to a variable
(setq version "24.3")
(setq editor "emacs" version "24.3")    ; this is a comment


;;; list operations

;; list is a sequence of zero or more lisp exp enclosed in parens
()

;; car returns first element of the list.
(car '(a b c d))

;; cdr returns first element of the list.
(cdr '(a b c d))

;; list - make list from arguments
(list 'a 'x "asdf" 6)


;; check for files & load them
(defun load-file-if-exists (list)
  "Check for file & load it."
  (let (value)
    (dolist (element list value)
      (if (file-exists-p element)
          (load-file (expand-file-name e lement prelude-personal-dir))))))

(load-file-if-exists '("config.el" "kbd.el" "packages.el" "prelude-modules.el"))
