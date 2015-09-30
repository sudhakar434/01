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

(let ((a "3"))
  a)

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

;; append items
(append '(1 2 3) '(a b c d))
(append '(1 2 3) )

(setq list1 '(1 2 3))
(add-to-list list1 4)



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


;; testing

(defun  add (x y)
  (+ x y))

(add 3 4)

(ert-deftest add-test ()
  (should (= 7 (add 3 4))))



(defun im-is-markdown-bufferp ()
  "return t if opened buffer is markdown"
  (member (downcase (file-name-extension (buffer-file-name)))
          '("md", "markdown")))

(call-process-shell-command
 
 
 
 )

(call-process "/bin/bash" nil t nil "-c" "ls -t ~/test.el *.txt | head -5")

(with-temp-buffer foo)
(call-process "/bin/bash" nil t nil "-c" 
              "pandoc -o test.html test.md")


(shell-command (format "%s -o %s %s"
                       "pandoc"
                       "test.html"
                       "test.md"
                       )
               )

(get-buffer-process (buffer-file-name))


(defun im-serve-file (file)
  (with-current-buffer (get-buffer file)
    (httpd-start)
    (impatient-mode)
    (browse-url (concat im-server-url temp-file))))

(im-serve-file "/home/anand/projects/lisp/impatient-markdown/test.html")

(get-buffer-create "/home/anand/projects/lisp/impatient-markdown/test.html")

(forward-block 2)

(defun forward-block (&optional n)
  (interactive "p")
  (let ((n (if (null n) 1 n)))
    (search-forward-regexp "\n[\t\n ]*\n+" nil "NOERROR" n)))




(defun elpy-shell-send-current-block ()
  "Send current statement to Python shell."
  (interactive)
  (beginning-of-line)
  (push-mark)
  (forward-block)
  (elpy-shell-send-region-or-buffer)
  (display-buffer (process-buffer (elpy-shell-get-or-create-process))
                  nil
                  'visible)
  )


(concat im-server-url "ff")

(browse-url "http://127.0.0.1:8080/imp/")



;; conditioanls
(if (not (require 'elpy))
    (message "elpy is not installed")
  (message "elpy is installed"))

(when (not (require 'elpy))
  (message "elpy is not installed")
  (message "go for next package."))

(cond 
 (1 2aa)
 (2 2))

(defun changed (&rest args)
  (message "changed"))

(add-hook 'after-change-functions 'changed nil t)

(dolist (buf impatient-markup-buffers-list)
  (shell-command (format "%s -o %s %s"
                         impatient-markup-pandoc
                         (impatient-markup-make-html-file buf)
                         (buffer-file-name buf)))
  (message "updated")
  )

(equal "abc" "abc")
(not (equal 3 4))


;; group a bunch of expressions
(progn (message "a") (message "b"))


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

(unless (< 2 3)
  (message "body execute"))

(unless nil
  (message "body execute"))

(unless t
  (message "body execute"))

(while nil
  (message "body execute"))

(defun imp--notify-clients ()
  (interactive)
  (while imp-client-list
    (imp--send-state-ignore-errors (pop imp-client-list))))

(unless t
  (message "body execute"))

;; try catch
(condition-case nil
    (progn
      (asaa)
      (message "running try "))
  (error
   (message "catched error")))

(eql "r" "ar")
(eql "r" "r")

(eq "r" "r")
(string-equal "r" "r")

(defun double-space-cleanup  ()
  (interactive)
  (goto-char (point-min))
  (while (/= (point) (point-max))
    (just-one-space)
    (forward-word)))


;; functions inbuilt
(defun cr (choice)

  ;; (interactive "c(C)hoose (A)n (O)ption")
  ;; (interactive "cBuffer to rename: \nsRename buffer %s to: ")
  (interactive "c[a]: a [b]:b")
  (require 'cl)
  ;; (interactive)
  ;; (read-char "(C)hoose (A)n (O)ption")
  ;; (if (= choice 97)
  ;;     (message "foo")
  ;;   (message "bar")
  ;;   )


  (case (char-to-string 114)
    ("r"
     (message "r"))
    ("i"
     (message "i"))
    (otherwise
     "Something else"))
  )





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


(progn 
  (setq function "foo")

  (save-excursion
    (with-help-window (help-buffer)
      (prin1 function)
      ;; Use " is " instead of a colon so that
      ;; it is easier to get out the function name using forward-sexp.
      (princ " is ")
      (describe-function-1 function)  
      (with-current-buffer standard-output
        ;; Return the text we displayed.
        (buffer-string)))))

(describe-function-1 'describe-function)
(describe-function-1 describe-function)
(describe-function)

(defun foo ()
  "fffffffff"
(message "%s" "aa"))
(message "%s" (find-lisp-object-file-name function 'foo))
(message "%s" (find-lisp-object-file-name 'foo function))
(message "%s" (find-lisp-object-file-name function #'describe-function))

(find-lisp-object-file-name #'describe-function function)
(find-lisp-object-file-name #'describe-function "elpy")
(find-lisp-object-file-name #'describe-function "elpy")


(help-make-xrefs "*Help*")
(help-make-xrefs "elisp.el")


(defun add-numbers (x y &optional z)
  (if z
      (+ x y z))
  (+ x y)
  )
(add-numbers 1 2 3)
(add-numbers 1 2)

(forward-line 1)
(forward-line 0)
(forward-line)
(forward-line -1)

(beginning-of-line)
(goto-char end)


(push-mark )
;; timers
(timer-create)

(print timer-list)
(print timer-idle-list)

;;(get-universal-time)
(current-time-string)
(current-time)




(defvar helm-source-commands-history
  
  )


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

(current-frame-configuration) 


(defun strip-text-properties(txt)
  (set-text-properties 0 (length txt) nil txt)
  txt)

(setq auto-capitalize-words '(1))

(defun add-to-autocapitalize-words ()
  "Add word at point to auto-capitalize-words list."
  (interactive)
  (add-to-list 'auto-capitalize-words 
               (strip-text-properties (thing-at-point 'word))))




(defun tap ()
  "Add word at point to auto-capitalize-words list."
  (interactive)
  (thing-at-point 'word))


(defun foo ()
  (message "foo"))

(add-hook 'buffer-list-update-hook 'foo)


(helm :sources helm-source-emacs-commands)
(defvar helm-source-emacs-commands
  (helm-build-sync-source "Emacs commands"
    :candidates (lambda ()
                  (let ((cmds) (h-cmds))
                    (mapatoms
                     (lambda (elt) (when (commandp elt) (push elt cmds))))
                    (dolist (elem extended-command-history)
                      (push (intern elem) h-cmds))
                    (append h-cmds cmds)))
    :coerce #'intern-soft
    :action #'command-execute)
  "A simple helm source for Emacs commands.")

(commandp 'gnus-score-mode)


(setq elem "foo")
(setq helm-commands-history-source nil)
(setq helm-commands-history-source (append '(intern elem) helm-commands-history-source))


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

(defun foo ()
  (interactive)
  (let ((beg (python-nav-beginning-of-statement))
        (end (python-nav-end-of-statement)))
    (elpy-shell-get-or-create-process)
    (python-shell-send-string (buffer-substring beg end)))
  ;; (python-shell-send-string "print('a')")
  )

(defun bar()
  (interactive)
  (python-shell-send-string (buffer-string) "print('a')"))

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

(defun ff ()
  (interactive)
  (let ((indent (current-indentation)))
    (while (eq indent (current-indentation))
      (previous-line))
    (next-line)
    (beginning-of-line)
    (set-mark-command nil)
    (while (eq indent (current-indentation))
      (next-line))
    (previous-line)
    (end-of-line)
    (setq deactivate-mark nil))
  )

(next-line -1)
(previous-line -1)

(* 2 3)

(defun move ()
  (interactive)
  (let  (indent (current-indentation))
    (while (eq indent (current-indentation))
      (next-line)))
  (previous-line))

(while 
    )
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

(buffer-string)

(timer-set-function real-auto-save-timer 'real-auto-save)
(timer-activate real-auto-save-timer)



(shell-command-to-string (concat "locate " (current-word) "|head -c -1" ))

(shell-command (format "%s"  "ls") "*scratch*")


(get-buffer-create  (concat (downcase (file-name-sans-extension buf)) ".html"))

(setq buf "/home/anand/projects/lisp/impatient-markup/README.md")


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



(recenter-top-bottom 0)  
(set-window-start (selected-window) (point))
;;; elisp.el ends here
