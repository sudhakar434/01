launch emacs
------------

    emacs -nd  # start emacs in terminal
    emacs -q   # start emacs without init file


control
-------

    C-u  # prefix argument
    C-/ (C-_ or C-x u)  undo
    C-+  # increase font size
    C--  # decrease font size
    C-o  open-line

    C-x m  eshell  # launch inferior shell
    C-x M-m  shell  # launch default shell

    C-x z  repeat  # Repeat last command
    C-x h  mark-whole-buffer
    C-x g  magit-status

    C-x C-s save-buffer  # Save file


help
----

    C-h    help
    C-h A  apropos  patterns matching word
    C-h c  describe-key-briefly
    C-h f  display documentation for given functions
    C-h k  describe-key
    C-h l  view-lossage  display last 300 input keystroke
    C-h r  emacs manual
    C-h w  where-is

    C-c C-h   show all key binding that start with C-c


windows
-------

    C-x 0  delete-window
    C-x 1  delete-other-windows
    C-x 2  split-window-below
    C-x 3  split-window-right
    C-x 4  # prefix to deal with files in other window
    C-x 4 f ido-find-file-other-window


macros
------

    C-x ( Start a macros
    C-x ) Stop macro
    C-x e execute a macro
    C-u 5 C-x e  # execute macro 5 times


narrowing
---------

    C-x n n  nnarrow-to-region
    C-x n d  py-narrow-to-defun
    C-x n p  narrow-to-region
    C-x n w  widen


bookmarks
---------

    C-x r m <RET>  bookmark-set
    C-x r b <bookmark> <RET>  bookmark-jump
    C-x r l  list-bookmarks


meta
----

    M-!  # run a shell command
    M-;  # comment/uncomment selected region
    M-^  delete-indentation

    M-g g (M-g M-g)  goto-line
    M-u  uppercase-word
    M-x  # run command by name


functions
=========

    browse-url  # open url
