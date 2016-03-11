branch
------

    git branch <new name>

    git checkout <branch>
    git checkout -b <branch>  # create & checkout to new branch

    git branch -D <branch>  #  delete
    git branch -m <branch>  # rename

    git merge <branch>  # merge current with another branch


patch
-----

    git format-patch -<n> <sha> # last n commits
    git format-patch --root <sha>
    git apply --stat <patch>
    git apply --check <patch>
    git am <patch>


remote
------

    git remote add <name> <url>
    git remote set-url <name> <url>
    git remote rename <old> <new>


gitignore
---------

    git rm -r --cached .
    git add .
    git commit -m ".gitignore updated"


rm
--

```
git rm $(git ls-files --deleted)
```


others
------

    # git reset
    git reset
    git reset --hard
    git reset --hard <old-commit-id>
    git branch -f <branch_name> <new_tip_commit> #move a branch to particular commit

    # Find the size of git repository
    git bundle create tmp.bundle --all
    du -sh tmp.bundle

    # To count hooks, stashes, config, rerere cache, backups
    git gc
    du -sh .git/

    gitk <file>  # Git - Check all revisions of a file

    git ls-files -d  # show deleted files
