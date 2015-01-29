Elpy package
==============


Key bindings
------------
::

   C-c C-f elpy-find-file

   C-c C-s elpy-rgrep-symbol

   C-c C-c elpy-shell-send-region-or-buffer

       C-u C-c C-c escape __name__ == "__main__" idiom

   C-c C-d elpy-doc

   C-c C-t elpy-test

   C-c C-v elpy-check

   C-c C-r elpy-refactor

   C-c RET elpy-import-symbol-at-point


functions
---------

M-x elpy-config - show current config

    1. elpy - elpy rpc backend
    2. completion - company minimum prefix length

M-x elpy-rpc-restart  - restart all RPC process

M-x elpy-set-project-root

M-x pyvenv-workon

M-x pyvenv-activate

M-x pyvenv-deactivate
