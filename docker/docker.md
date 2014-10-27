##  Docker

#### Suppress WARNING: No swap limit support
     
     sudoedit /etc/default/grub
     GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1" 
     sudo update-grub && shutdown -r 0 

