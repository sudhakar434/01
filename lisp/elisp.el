;;; elisp --- simple elisp
;;; Commentary:

;;; code:

;;; BASICS

;; assign value to a symbol
(set 'version "24.3")

;; assign value to a variable
(setq version "24.3")
(setq editor "emacs" version "24.3")    ; this is a comment

;; use let for local variables
(let (a b)
  (setq a 3)
  (setq b 4)
  (+ a b))


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


;; conditioanls
(if (not (require 'elpy))
    (message "elpy is not installed")
  (message "elpy is installed"))

(when (not (require 'elpy))
  (message "elpy is not installed")
  (message "go for next package."))

(equal "abc" "abc")
(not (equal 3 4))



;;; functions


;; connect to server sql
(sql-mysql (setq sql-user "root" sql-password "bacillus123"
                 sql-database "pearl" sql-server "192.168.0.100"))


;; check for files & load them
(defun load-file-if-exists (list)
  "Check for file & load it."
  (let (value)
    (dolist (element list value)
      (if (file-exists-p element)
          (load-file (expand-file-name e lement prelude-personal-dir))))))

(load-file-if-exists '("config.el" "kbd.el" "packages.el" "prelude-modules.el"))


;; mysql
(setq sql-mysql-login-params
      '((user :default "root")
        (database :default "pearl")
        (server :default "192.168.0.110")
        (port :default 5432)))


sort-lines
delete-trailing-whitespaces
count-words  # word count on current buffer

(defalias 'qrr 'query-replace-regexp)

(unless (file-exists-p "file.txt") (shell-command "touch file.txt"))


;;; variables
package-activate-list  - list of installed packages




;;; elisp.el ends here
