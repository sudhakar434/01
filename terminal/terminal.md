### Become a Terminal Pro ##


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
    ps x -o  "%p %r %y %x %c "   #process with id & parent id
    nice -n 19 command - run this command with lowest priority
    2>/dev/null 1>/dev/null google-chrome &
    ps axjf  #get process group id


#### awk

    ls -l | awk '{ print $5  }'
    ls -l | awk '{ print $2, '\t', $1  }'
    awk 'BEGIN { print "Last \t Job"  } { print $2, '\t', $4  }'
    cat test.txt | awk '{print NR, NF, $0 }'
    ls -l | awk '{ if ( NF >= 9  ) { print $9  }  }'


#### sed

    sed -n 5p file          #print line 5 from file
    sed -n '5,10p' file     #print 5 to 10 lines
    sed -i '$ d' foo.txt    #delete last line of file


#### grep

     grep -rl "django" /path/to/dir/  # search for string in all files
     grep -v 'django'  # grep for non matching lines
     ps -ef | grep '[c]elery'    #grep ps without grep


#### usb

     #write permissions for pendrive
     sudo mount -o remount,rw '/media/SGTL MSCN'


#### playing with files

     wc -L file  #line which is max length in file
     head -n -1 foo.txt #show foo.txt without last line

     split -b 1024 big_file small_file_prefix
     split -l 1000 big_file small_file_prefix

     # run bash as sudo to append file
     sudo bash -c "cat in_file >> append_file"
     cat in_file | sudo tee -a append_file

    bzip2 file  #compress
    bunzip2 file.bz2 #decompress
    gzip file
    zip file.zip file


#### network

     #show other computers in lan
     avahi-browse -tl _workstation._tcp

     ssh user@host

     rsync -a user@host:/path/to/dir /path/to/target
     options: -avn :: archive, verbose, dry run

     rfkill list #show status of wireless devices
     ifconfig # show ip, mac address


#### Others

     top -> 1 - show cpu core usage
     alias ls='ls -a'

     sudo passwd #set a single char password

     df -h  #show file system disk usage
     du -ksh /var/lib/mysql/    #mysql data usage
     du -hs #show human readable summary of disk usage
     du -d=1  # --max-depth = 1
     du /var/lib/mysql/ -sh
