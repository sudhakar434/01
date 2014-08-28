## Learn Ubuntu


### Installing screenkey
Screenkey shows the keys pressed while screencasting

    sudo apt-get install screenkey

However, to stop the programm, there is no app layout or anything. It has to be stopped from the system monitor or from terminal

    Press (super) and search for system monitor.

Open terminal and type 

    gnome-system-monitor



### JOBS & PRIORITY

List all jobs running in the current terminal
    jobs

Display all linux tasks
    top

Change priority of jobs
    renice -20(priority) 7448(jobid)


### IDENTIFY BOTTLENECK 
    mpstat
    sar
    vmstat -s
    vmstat -m | head -5
    vmstat -f
    vmstat
    iotop
    htop


