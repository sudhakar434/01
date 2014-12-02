##  Docker

#### Suppress WARNING: No swap limit support

     sudoedit /etc/default/grub
     GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"
     sudo update-grub && shutdown -r 0

#### General

    docker images
    docker ps
    docker ps -a
    docker ps -aq # list only container ids
    docker commit <name>
    docker start <id>
    docker stop <id>
    docker attach <id>
    docker build

    docker run -ditp 8001:8001 <image>
    docker inspect <id>
    docker history <image>
    docker search <image name>
    docker pull


