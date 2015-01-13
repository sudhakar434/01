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
