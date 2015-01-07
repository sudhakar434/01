;; assign value to a symbol
(set 'version "24.3")

;; assign value to a variable
(setq version "24.3")
(setq editor "emacs" versin "24.3")


;; ;; check for files & load them
;; (defun load-file-if-exists (list)
;;   "Check for file & load it."
;;   (let (value)
;;     (dolist (element list value)
;;       (if (file-exists-p element)
;;           (load-file (expand-file-name e lement prelude-personal-dir))))))

;; (load-file-if-exists '("config.el" "kbd.el" "packages.el" "prelude-modules.el"))
