;;; elisp --- simple elisp
;;; Commentary:


;;; code:

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
