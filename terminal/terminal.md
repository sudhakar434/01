## Terminal Commands

#### anti virus
```shell
sudo apt-get install clamav

# update virus database
sudo freshclam

# scan dir & list infected files
sudo clamscan -r -i /home
```


#### cron

```shell
# run job every minute
*/1 * * * * foo

# check cron log
grep CRON /var/log/syslog
```


#### logs

```shell
# log stdout stderr to file
command >> log_file 2>&1
command >> log_file 2>> err_file

# check system log messages
sudo cat /var/log/syslog
# check error messages
sudo cat /var/log/dmesg
```


#### packages

```shell
# upgrade a single package
sudo apt-get install --only-upgrade tree
```


#### networking

```shell
# show ip, mac address
ifconfig

# show other computers in lan
avahi-browse -tl _workstation._tcp

# ssh using keys
ssh-keygen -t rsa

chmod 700 .ssh
chmod 644 authorized_keys

cat .ssh/id_rsa.pub | ssh user@host 'cat >> .ssh/authorized_keys'

ssh-copy-id user@host

ssh user@host

# copy files
rsync -raz --progress user@host:/path/to/dir /path/to/target

# show status of wireless devices
rfkill list

# which process is listening on which port
sudo netstat -peanut

# check port 8000
sudo netstat -peant | grep ":8000 "
lsof -i :8000

# what ports are open on any machine
sudo apt-get install --yes nmap
nmap 192.168.1.33
namp localhost

# local machine
sudo netstat -tulpn
sudo netstat -tulpn | grep LISTEN
```


#### process

```shell
# run a job in background
emacs &

# list all jobs with PID
jobs -l

# switch jobs from background to foreground
fg
bg

# detach a process from terminal
disown

# ignore SIGHUP signal sent by terminal
nohup

# list all process
ps -ef

# kill process
kill -9 <PID>
pkill emacs

# run this command with lowest priority
nice -n 19 command
```


#### time/date

```shell
# show time/date
date

# set time/date
sudo date --set "25 Sep 2013 15:00:00"  # set date

# set timezone
sudo dpkg-reconfigure tzdata  # set timezone
```


#### system info

```shell
# print distribution specific info
lsb_release -a

# display number of cores in a CPU
nproc
cat /proc/cpuinfo | grep processor | wc -l  # show no. of cpu

# display amount of used/free memory in system (ram)
free -h

# show cpu architecture
lscpu

# list all pci connections
lspci
lspci -v

# show graphic card details
lspci | grep VGA

# show specific slot details
lspci -v -s 00:02.0

# all hardware memory info
sudo lshw -C memory

# maximum ram supported & available slots
sudo dmidecode -t memory
sudo dmidecode -t 16
```


#### firewall

```shell
# show firewall status
sudo ufw status verbose

# enable/disable
sudo ufw enable
sudo ufw disable

# allow/deny ports
sudo ufw allow <port no>
sudo ufw deny <port no>
sudo ufw delete <port no>

sudo ufw logging [on/off]
```


#### usb

```shell
# list block devices
lsblk

# write permissions for a pendrive
dosfsck -a /dev/sdb1

# write permissions for pen drive
sudo mount -o remount,rw /media/foo/usb-drive

# bootable usb
# write to that device
sudo dd if=ubuntu-14.04-desktop-amd64.iso of=/dev/sdc
```


#### git

```shell
# update git
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install --yes git

# store git credentials
git config credential.helper store


# squash last n commits
git reset --soft HEAD~n
git commit -m "Commit message"
```


#### grep

```shell
# grep for matching lines
grep 'foo' bar.txt
# grep for non matching lines
grep -v 'foo' bar.txt

# grep with context
grep -C 10 'foo' bar.txt
grep -A 5 -B 5 'foo' bar.txt

# search for string in all files
grep --recursive --files-with-matches 'foo' /path
grep -rl "foo" /path/to/dir/

#grep ps without grep
ps -ef | grep '[c]elery'
```

----------------------------------------------------


#### find


```
find <path> -name <filename/pattern> -type
find <path> -iname <filename> -type d
find . -name "*.py" -type f -delete  # delete all txt files
find . -type f ! -name '*.txt' -delete  #     delete all files EXCEPT *.txt
```




#### awk

```
ls -l | awk '{ print $5  }'
ls -l | awk '{ print $2, '\t', $1  }'
awk 'BEGIN { print "Last \t Job"  } { print $2, '\t', $4  }'
cat test.txt | awk '{print NR, NF, $0 }'
ls -l | awk '{ if ( NF >= 9  ) { print $9  }  }'
```


sed
---

```
sed -n 5p file          #print line 5 from file
sed -n '5,10p' file     #print 5 to 10 lines
sed -i '$ d' foo.txt    #delete last line of file
sed '/foo/,/bar/d' 1 > 2 # delete from foo to bar in 1 and store in 2

```



disks
------

```
lsblk  # list block devices

sudo lshw -class disk -short  # list disks

fdisk -l  # list partition table

Df -T  # list disks with fs type


# mount new hdd
sudo fdisk /dev/sd*

# n -> primary -> number 1 -> w

sudo mkfs -t ext4 /dev/sdb1

sudo mount /dev/sd* </some/path/>

[More](https://help.ubuntu.com/community/InstallingANewHardDrive)

# mount ntfs external hdd
sudo apt-get install ntfs-3g
sudo ntfsfix /dev/sdXX
```


nfs
----

```
# Install package:
sudo apt-get install nfs-kernel-server nfs-common


# Mount:
sudo mount -o soft,intr,rsize=8192,wsize=8192 <ip>:/nfs /path/to/mount


# Find firmware version:
cat /etc/version  # in nfs after ssh


# links:

https://help.ubuntu.com/community/SettingUpNFSHowTo

http://community.wd.com/t5/WD-My-Cloud/bd-p/mycloud

http://community.wd.com/t5/WD-My-Cloud/NFS-broken-after-firmware-4-00/td-p/792069/highlight/true
```


#### files

```shell
# show files in tree format
tree -Cfhpu

# number of columns with delimiter ;
awk -F';' '{print NF; exit}' foo.txt
head -1 foo.txt | tr ';' '\n' | wc -l


tail -n+100 <file> | head -n1  # print 100th line
sed '100q;d' <file>    # print 100th line

base64 /dev/urandom | head -c 10000000 > random4.txt  # generate 1mb random file


shopt -s extglob
rm *.!(txt) Or in  # delete all files EXCEPT *.txt

rm *~*.txt(.) # zsh

wc -L file  #line which is max length in file
head -n -1 foo.txt #show foo.txt without last line

split -b 1024 big_file small_file_prefix
split -l 1000 big_file small_file_prefix

# run bash as sudo to append file
sudo bash -c "cat in_file >> append_file"
cat in_file | sudo tee -a append_file
```


#### zip

```shell
bzip2 file  #compress
bunzip2 file.bz2 #decompress

gzip file

zip file.zip file
zip -r file.zip file  # recursive zip
```




network
-------

    #show other computers in lan
    avahi-browse -tl _workstation._tcp

    # ssh using keys
    ssh-keygen -t rsa
    cat .ssh/id_rsa.pub | ssh user@host 'cat >> .ssh/authorized_keys'
    ssh-copy-id user@host
    ssh user@host

    # copy files
    rsync -a user@host:/path/to/dir /path/to/target
    options: -avn :: archive, verbose, dry run

    rfkill list #show status of wireless devices
    ifconfig # show ip, mac address



services
--------

```
sudo service <name> start/stop/status/restart

sudo start/stop/status/restart <service>
```


#### top

```
1 - show cpu core usage
n - set number of tasks
W - write .toprc config file
```


#### alias

```
alias  # show all alias
alias ls='ls -a'
```


#### Others

```
sudo passwd #set a single char password
df -h  #show file system disk usage
du -ksh /var/lib/mysql/    #mysql data usage
du -hs #show human readable summary of disk usage
du -d=1  # --max-depth = 1
du /var/lib/mysql/ -sh

sudo dpkg-reconfigure tzdata  # set timezone
```


### Tools to identify bottleneck
    mpstat
    sar
    vmstat -s
    vmstat -m | head -5
    vmstat -f
    vmstat
    iotop
    htop


### FTP

```
wget --user='user' --password='password' ftp://foo.com/bar  # download ftp file

$ ftp <ip>
ftp> open <ip>
ftp> put <source> <target>
```

### ftp server

```
# Install:
sudo apt-get install vsftpd -y


# Conf file:
/etc/vsftpd.conf


# Create New User:
sudo adduser <user>
sudo mkdir /home/<user>/
sudo usermod -d /home/ftpuser/<user> <user>
sudo usermod -s /sbin/nologin <user>
sudo chown -R ftpuser:ftpgroup /home/ftpuser/<user>
```






### users

```
sudo adduser <foo>

sudo adduser <username> sudo  # add user to sudo

grep -Po '^sudo.+:\K.*$' /etc/group  # show all sudo users

sudo deluser <username> sudo  # remove username from sudoers list
```


#### GPU/CUDA DRIVERS:

Find graphic car version:

```
lspci | grep VGA
```

Process:
http://askubuntu.com/questions/338907/how-to-install-cuda-5-5-under-ubuntu-12-04-lts-64-bit

nvidia docs:: run file install:
http://docs.nvidia.com/cuda/cuda-getting-started-guide-for-linux/index.html

run ubuntu in text mode:
http://askubuntu.com/questions/16371/how-do-i-disable-x-at-boot-time-so-that-the-system-boots-in-text-mode
