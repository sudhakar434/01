### Become a Terminal Pro ##


#### awk - programming language ###

awk is pattern scanning and processing language

    ls -l | awk '{ print $5  }'
    ls -l | awk '{ print $2, '\t', $1  }'
    awk 'BEGIN { print "Last \t Job"  } { print $2, '\t', $4  }'
    cat test.txt | awk '{print NR, NF, $0 }'
    ls -l | awk '{ if ( NF >= 9  ) { print $9  }  }'


    
#### System Info - Os, CPU, GPU

     lsb_release -a    #print distribution specific info
     nproc - display number of cores in a CPU
     cat /proc/cpuinfo | grep processor | wc -l #show no. of cpu 
     lscpu  #show cpu architecture 
     lspci #list all pci connections
     lspci | grep VGA #show graphic card details 
     lspci -v -s 00:02.0 #show graphic card details
     sudo dmidecode -t 16 #maximum ram supported & available slots
     sudo lshw -C memory  #all hardware memory info

              
#### JOBS
    &       - run a job in background
    jobs -l - list jobs will PID
    fg, bg  - switch jobs from background to foreground
    disown  - detach a process from terminal
    nohup   - ignore SIGHUP signal sent by terminal
    ps -ef  - list all process


#### Others

     du -hs #show human readable summary of disk usage
     top -> 1 - show cpu core usage
     alias ls='ls -a'
     grep -rl "django" /path/to/dir/     #search for string in all files
     grep -v 'django'    #grep for non matching lines

    
