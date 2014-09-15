## Git!!! ##

#### Update git on ubuntu from command line ###
    sudo apt-get install python-software-properties 
    sudo add-apt-repository ppa:git-core/ppa 
    sudo apt-get update 
    sudo apt-get install git  


#### User configuration ##
    git config --global user.name "username"
    git config --global user.email "your.email@gmail.com" 
 

#### Color highlighting for console 
    git config --global color.ui true
    git config --global color.status auto
    git config --global color.branch auto 


#### Set vim as default editor for Git (Linux)
    git config --global core.editor vim 


#### Query git settings of local repo
    git config --list 


#### Push changes to git
    git push add origin


#### Find the size of git repository
    git bundle create tmp.bundle --all
    du -sh tmp.bundle

#### To count hooks, stashes, config, rerere cache, backups 
    git gc
    du -sh .git/


#### Store git credentials
    git config credential.helper store
    git push http://example.com/repo.git


#### Where is git installed
    which git

#### Commit only one file 
    git commit -m 'my message' path/to/file.ext
    
#### Beautiful git logs
    [alias]
    lg1 = log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
    lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
    lg = !"git lg1"
    
#### Roll back to specific commit 

    git reset --hard <old-commit-id>
    git push -f 


#### Git - Check all revisions of a file

     gitk <file>

