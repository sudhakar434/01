### Become a Terminal Pro ##

#### awk - programming language ###
awk is pattern scanning and processing language

    ls -l | awk '{ print $5  }'
    ls -l | awk '{ print $2, '\t', $1  }'
    awk 'BEGIN { print "Last \t Job"  } { print $2, '\t', $4  }'
    cat test.txt | awk '{print NR, NF, $0 }'
    ls -l | awk '{ if ( NF >= 9  ) { print $9  }  }'

#### Search for a string in all files of a directory recursively
    grep -rl "django" /path/to/dir/
    
#### Grep non mathcing lines
    grep -v 'django'   
    
#### tmux 
    ctrl + b % - split vertically
    ctrl + b " - split window horizontally
    ctrl + b arrow keys - switch panes
    
#### byobu
    F2 - Create new window
    F3 - Move to previous window
    F4 - Move to next window
    
    ctrl + F2 - Split the screen vetically
    shift + F2 - Split the screen horizontally
    shift + F3 - Move to previous split screen
    shift + F4 - Move to next split screen

#### Cores, Grpahics - CPU
    nproc - display number of cores in a CPU
    top -> 1 - show cpu core usage
    cat /proc/cpuinfo | grep processor | wc -l #show no. of cpu 
    lscpu  #show cpu architecture 
    lspci #list all pci connections
    lspci | grep VGA #show graphic card details 
    lspci -v -s 00:02.0 #show graphic card details

#### Find size of a directory
    du -hs #show human readable summary of disk usage
    
#### Find details of Linux OS
    lsb_release -a

#### Maximum RAM capacity & no of slots
    sudo dmidecode -t 16
    sudo dmidecode -t memory
    sudo lshw -C memory

