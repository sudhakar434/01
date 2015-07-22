;;; elisp --- simple elisp
;;; Commentary:

;;; code:



;;; BASICS

;; assign value to a symbol
(defparameter vern 11)

(defvar version 11)
(set 'version "24.3")

;; assign value to a variable
(setq version 11)
(setq version (1+ version))

(setq editor "emacs" version "24.3")    ; this is a comment

;; use let for local variables
(let (a b)
  (setq a 3)
  (setq b 4)
  (+ a b))

(setq y 2)

(let ((y 1)
      (z y))
  (list y z))

(let* ((y 1)
       (z y))    ; Use the just-established value of y.
  (list y z))



;;; list operations

;; list is a sequence of zero or more lisp exp enclosed in parens
()

;; car returns first element of the list.
(car '(a b c d))

;; cdr returns first element of the list.
(cdr '(a b c d))
(cdr '(a b))
(car (cdr '(a b)))

;; list - make list from arguments
(list 'a 'x "asdf" 6)

(setq ll '("elisp.el" "test"))
(remove (buffer-name) ll)
(message "%s" ll)



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


;; group a bunch of expressions
(message "a") (message "b")
(progn (message "a") (message "b"))
(progn 3 4 )

;; iteration
(setq x 0)

(while (< x 4)
  (print (format "yay %d" x))
  (setq x (1+ x)))


;; dolist
(setq animals '(gazelle giraffe lion tiger))

(defun print-list (list)
  (dolist (element list)
    (message "%s" element)))

(print-list animals)

(let (value)
  (dolist (element animals value)
    (message "%s" value)
    (message "%s" animals)))

(defun reverse-list-with-dolist (list)
  "Reverse elements with dolist"
  (let (value)
    (dolist (element list value)
      (setq value (cons element value)))))

(reverse-list-with-dolist animals)




;; try catch
(condition-case nil
    (progn
      (asaa)
      (message "running try "))
  (error
   (message "catched error")))

(if (get-buffer "a")
    (message "a")
  (message "b"))


;; functions
(defun yay ()
  "Insert “Yay!” at cursor position."
    (insert "Yay!"))

(defun yay ()
  "Insert “Yay!” at cursor position."
  (interactive)
  (insert "Yay!"))

(defun myFunction (myArg)
  "Prints the argument"
  (interactive "p")
  (message "Your argument is: %d" myArg))

(defun myFunction (myStart myEnd)
  "Prints region start and end positions"
  (interactive "r")
  (message "Region begin at: %d, end at: %d" myStart myEnd))

(defun add-number (x y)
  "Add two numbers"
  (interactive)
  (message (+ x y)))
(add-number)


(defun add-number (x y)
  "…"
  (interactive "nN1: \n N2: \n")
  (message "sum is %d" (+ x y)))

(defun add-numbers (x y &optional z)
  (if z
      (+ x y z))
  (+ x y)
  )
(add-numbers 1 2 3)
(add-numbers 1 2)



;; timers
(timer-create)

(print timer-list)
(print timer-idle-list)

;;(get-universal-time)
(current-time-string)
(current-time)

((symbol-at-point))

;; helm
(helm :sources (let ((cmds  ()))
                 (mapatoms (lambda (s) (when (commandp s) (push s cmds))))
                 cmds))

(helm
 :sources '(helm-source-dired-recent-dirs)
 :buffer buf)

(helm
 :sources '(1 2 3)
 :buffer buf)



(defun django-jump-to-template ()
  (interactive)
  (let ((fname (replace-regexp-in-string django-template-regexp "\\2"
                                         (thing-at-point 'line))))
    (let ((projfname (concat (django-root) "templates/" fname))
          (appfname (concat default-directory "templates/" fname)))
      (if (file-exists-p appfname)
          (find-file appfname)
        (find-file projfname)))))


(defun xx ()
  "print current word."
  (interactive)
  (message "%s" (thing-at-point 'word)))

(defun xx2 ()
  "print current word."
  (interactive)
  (let (p1 p2)
    (save-excursion
      (skip-chars-backward "-a-z0-9./")
      (setq p1 (point))
      (skip-chars-forward "-a-z0-9./")
      (setq p2 (point))
      (message "%s" (buffer-substring-no-properties p1 p2)))))

"(or (> (nth 0 (syntax-ppss)) 0) (nth 3 (syntax-ppss)))"
(syntax-ppss '(193, 12))
(nthcdr 3 '(1 2  3 4 5))
(cdr '(1 2  3 4 5))
(nth 3 '(1 2 3 4 5))


(defun point-in-string-or-comment ()
  "This is it."
  (interactive)
  (let ((ppss (syntax-ppss)))
    (or (car (setq ppss (nthcdr 3 ppss)))
        (car (setq ppss (cdr ppss)))
        (nth 3 ppss))))

(defun elpy-doc--symbol-at-point ()
  "Return the Python symbol at point, including dotted paths."
  (with-syntax-table python-dotty-syntax-table
    (let ((symbol (symbol-at-point)))
      (if symbol
          (symbol-name symbol)
        nil))))

(elpy-doc--symbol-at-point)


(defun test-inside-curly-braces ()
  (interactive)
  (when (and (looking-back "'\\(.*?\\)") (looking-at "\\(.*?\\)'"))
    (message "inside curly braces")))


(defun beginning-of-string ()
  "Moves to the beginning of a syntactic string"
  (interactive)
  (unless (point-in-string-p (point))
    (error "You must be in a string for this command to work"))
  (while (point-in-string-p (point))
    (forward-char -1))
  (point))

(defun qq ()
  "Moves to the beginning of a syntactic string"
  (interactive)
  (unless (point-in-string-p (point))
    (error "You must be in a string for this command to work"))
  (while (point-in-string-p (point))
    (forward-char -1))
  (progn
    (point)
    (point)))

(defun swap-quotes ()
  "Swaps the quote symbols in a \\[python-mode] string"
  (interactive)
  (save-excursion
    (let ((bos (save-excursion
                 (beginning-of-string)))
          (eos (save-excursion
                 (beginning-of-string)
                 (forward-sexp)
                 (point)))
          (replacement-char ?\'))
      (goto-char bos)
      ;; if the following character is a single quote then the
      ;; `replacement-char' should be a double quote.
      (when (eq (following-char) ?\')
        (setq replacement-char ?\"))
      (delete-char 1)
      (insert replacement-char)
      (goto-char eos)
      (delete-char -1)
      (insert replacement-char))))


(search-forward-regexp ".")
(buffer-file-name)
(setq test-str )
(string-match "eliz" buffer-file-name)
(string-match tramp-file-name-regexp buffer-file-name)

(goto-char (nth 8 (syntax-ppss)))
           
(point)
(mark)
(current-buffer)

(defvar helm-source-commands-history
  (helm-build-sync-source "Emacs commands history"
    :candidates (lambda ()
                  (let ((cmds))
                    (dolist (elem extended-command-history)
                      (push (intern elem) cmds))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "Emacs commands history")

(helm :sources helm-source-commands-history)

{ "(test-inside-curly-braces)" }

(setq real-auto-save-timer (timer-create))
(timer-set-time real-auto-save-timer (current-time)
                real-auto-save-interval)


(timer-set-function real-auto-save-timer 'real-auto-save)
(timer-activate real-auto-save-timer)


(defun shell-command-to-string (command)
  "Execute shell command COMMAND and return its output as a string."
  (with-output-to-string
    (with-current-buffer standard-output
      (call-process shell-file-name nil t nil shell-command-switch command))))

(defun goto-file ()
  "open file under cursor"
  (interactive)
  (find-file (shell-command-to-string (concat "locate " (current-word) "|head -c -1" )) ))



(defadvice do-auto-save (around maybe-run-after-save-hooks activate)
  (let (maybe-auto-save-buffers)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and auto-save-visited-file-name
                   (recent-auto-save-p)
                   (buffer-modified-p))
          (push buf maybe-auto-save-buffers))))
    ad-do-it
    (dolist (buf maybe-auto-save-buffers)
      (with-current-buffer buf
        (unless (buffer-modified-p)
          (message "Running after-save-hook in %s" (buffer-name))
          (run-hooks after-save-hook))))))




(defvar django-nonindenting-tags
  '("cache" "csrf_token" "cycle" "debug" "extends" "firstof" "include" "load" "now"
    "regroup" "ssi" "templatetag" "trans" "url" "widthratio")
  "List of tags that do not imply indentation (or require an end tag).")
(print django-nonindenting-tags)

(defvar django-indenting-tags
  '("autoescape" "block" "blocktrans" "comment" "elif" "else" "empty"
    "filter" "for" "if" "ifchanged" "ifequal" "ifnotequal" "plural" "spaceless" "verbatim" "with")
  "List of template tags that imply indentation.")

(defvar django-indenting-tags-regexp
  (regexp-opt pony-indenting-tags)
  "Regular expression matching a template tag that implies indentation.")


(defun sgml-indent-line-num ()
  "Indent the current line as SGML."
  (let* ((savep (point))
         (indent-col
          (save-excursion
            (back-to-indentation)
            (if (>= (point) savep) (setq savep nil))
            (sgml-calculate-indent))))
    (if (null indent-col)
        0
      (if savep
          (save-excursion indent-col)
        indent-col))))












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


(defvar elpy-config--get-config "import json
import sys

try:
    import xmlrpclib
except ImportError:
    import xmlrpc.client as xmlrpclib

from distutils.version import LooseVersion

config = {}
json.dump(config, sys.stdout)
")


(define-minor-mode esc-mode
  "Toggle esc-keys mode.
   A minor mode so that my key settings override annoying major modes."
  t " esc" 'esc-mode-map)




;;; elisp.el ends here
