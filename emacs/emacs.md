####  emacs keybindings

    emacs -nd  # start emacs in terminal


    C-h  # display help
    C-h c  describe-key-briefly
    C-h k  describe-key
    C-h w  where-is  # which keystrokes invoke given command
    C-h f  # display documentation for given function
    C-h l  view-lossage  #display last 300 input keystroke

    C-c C-h   # show all key binding that start with C-c


    C-u  # prefix argument
    C-/ (C-_ or C-x u)  undo
    C-+  # increase font size
    C--  # decrease font size
    C-=  expand-region


    C-x 0  delete-window
    C-x 1  delete-other-windows
    C-x 2  split-window-below
    C-x 3  split-window-right
    C-x 4  # prefix to deal with files in other window
    C-x 4 f ido-find-file-other-window

    C-x z  repeat  # Repeat last command
    C-x h  mark-whole-buffer
    C-x g  magit-status

    C-x C-s save-buffer  # Save file

    C-x ( Start a macros
    C-x ) Stop macro
    C-x e execute a macro
    C-u 5 C-x e  # execute macro 5 times


    M-!  # run a shell command
    M-g g (M-g M-g)  goto-line
    M-x  # run command by name
    M-;  # comment/uncomment selected region


#### functions

    sort-lines
    delete-trailing-whitespaces
    count-words  # word count on current buffer

    (defalias 'qrr 'query-replace-regexp)

    (unless (file-exists-p "file.txt") (shell-command "touch file.txt"))
