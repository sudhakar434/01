## Git!!! ##

#### Installation

    sudo apt-get install python-software-properties
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git


#### Configuration

    git config --global user.name "username"
    git config --global user.email "your.email@gmail.com"

    git config --global color.ui true
    git config --global color.status auto
    git config --global color.branch auto

    git config --global core.editor vim

    git config --list

    git config credential.helper store #store credentials


#### Push

    git push add origin
    git push <remote> <local branch>:<remote branch>
    git push -f # force update


#### Commit

    # to commit only one file
    git commit -m 'my message' path/to/file.ext

    # commit a part of file
    git commit --patch <file_name>


#### Beautiful git logs
    [alias]
    lg1 = log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
    lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
    lg = !"git lg1"


#### Git - Check all revisions of a file

     gitk <file>


#### stash

     git stash
     git stash list
     git stash applly stash_num
     git stash pop


#### others

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


#### Branch

    git branch <new name>
    git checkout <branch>
    git branch -D <branch> #delte
    git branch -M <brnach> #rename

#### Patch

    git format-patch -<n> <sha> # last n commits
    git format-patch --root <sha>
    git apply --stat <patch>
    git apply --check <patch>
    git am < am
