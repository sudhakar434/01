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

;; printing
(message "Master emacs")
(message "emacs version %s" "24.3")

;; arithmetic
(- 9 2 3)
(expt 2 3)

(integerp 3.)
(floatp 3.)

;; true false
(if nil "yes" "no")
(if () "yes" "no")
(if '() "yes" "no")
(if (list) "yes" "no")
(if t "yes" "no")
(if 0 "yes" "no")
(if "" "yes" "no")
(if [] "yes" "no")
(and t nil)
(or t nil)
