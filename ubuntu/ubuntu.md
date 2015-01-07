Linux
=====




#### Installing screenkey

    # Screenkey shows the keys pressed while screencasting
    sudo apt-get install screenkey
    # need to stop it from system-monitor


#### usb write permissions

     df -Th
     unmout /media/
     dosfsck -a /dev/sdb1


### JOBS & PRIORITY


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
