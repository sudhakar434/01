## Terminal Commands



#### alias

```
alias  # show all alias
alias ls='ls -a'
```



#### cron

```shell
# run job every minute
*/1 * * * * foo

# check cron log
grep CRON /var/log/syslog
```



#### disks

```
# list block devices
lsblk

# list drives
sudo lshw -class disk -short

# show file system
df
# show file system type
df -T
# show human readable summary of disk usage
du -hs
# size of folder
du -hs /var/lib/mysql/


# mount new hdd
sudo fdisk /dev/sd*
# n -> primary -> number 1 -> w
sudo mkfs -t ext4 /dev/sdb1
sudo mount /dev/sd* </some/path/>

https://help.ubuntu.com/community/InstallingANewHardDrive


# mount ntfs external hdd
sudo apt-get install ntfs-3g
sudo ntfsfix /dev/sdXX


# nfs
# install package
sudo apt-get install nfs-kernel-server nfs-common
# mount
sudo mount -o soft,intr,rsize=8192,wsize=8192 <ip>:/nfs /path/to/mount

# find firmware version
ssh user@ip
cat /etc/version

https://help.ubuntu.com/community/SettingUpNFSHowTo
```



#### files

```shell
# number of columns with delimiter ;
awk -F';' '{print NF; exit}' foo.txt
head -1 foo.txt | tr ';' '\n' | wc -l

# print 100th line
tail -n+100 <file> | head -n1
sed '100q;d' <file>

# show foo.txt without last line
head -n -1 foo.txt

# line which is max length in file
wc -L file

# awk
ls -l | awk '{ print $5  }'
ls -l | awk '{ print $2, '\t', $1  }'
awk 'BEGIN { print "Last \t Job"  } { print $2, '\t', $4  }'
cat test.txt | awk '{print NR, NF, $0 }'
ls -l | awk '{ if ( NF >= 9  ) { print $9  }  }'

# print line 5 from file
sed -n 5p file
# print 5 to 10 lines
sed -n '5,10p' file
# delete last line of file
sed -i '$ d' foo.txt
# delete from foo to bar in 1 and store in 2
sed '/foo/,/bar/d' 1 > 2


# generate 1mb random file
base64 /dev/urandom | head -c 10000000 > random4.txt

# split file
split -b 1024 big_file small_file_prefix
split -l 1000 big_file small_file_prefix


# show files in tree format
tree
tree -Cfhpu

# run bash as sudo to append file
sudo bash -c "cat in_file >> append_file"
cat in_file | sudo tee -a append_file
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



#### ftp

```shell
# download sftp file
wget --user='user' --password='password' ftp://foo.com/bar

ftp <ip>
ftp> open <ip>
ftp> put <source> <target>


# ftp server

# install
sudo apt-get install vsftpd -y
# update config
sudo vim /etc/vsftpd.conf

# create new user
sudo adduser <user>
sudo usermod -d /home/<user> <user>
sudo usermod -s /sbin/nologin <user>
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



#### packages

```shell
# upgrade a single package
sudo apt-get install --only-upgrade tree
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

#### security

```shell
# enable automatic security updates
sudo apt-get install unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades


# anti virus
sudo apt-get install clamav
# update virus database
sudo freshclam
# scan dir & list infected files
sudo clamscan -r -i /home


# root kit checker
sudo apt-get install -y rkhunter
# rkhunter check & report warnings only
sudo rkhunter -c --rwo
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


#### time/date

```shell
# show time/date
date

# set time/date
sudo date --set "25 Sep 2013 15:00:00"  # set date

# set timezone
sudo dpkg-reconfigure tzdata  # set timezone
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


#### services

```shell
sudo service <name> start/stop/status/restart

sudo start/stop/status/restart <service>
```



#### users

```shell
# create new user
sudo adduser <foo>

# add user to sudo
sudo adduser <username> sudo

# remove username from sudoers list
sudo deluser <username> sudo

# show all sudo users
grep -Po '^sudo.+:\K.*$' /etc/group

# change user password
sudo passwd <username>

# change admin passwd
# recovery mode -> root ->
mount -rw -o remount /
sudo passwd <user>


# remove password prompt for a user
sudo visudo
# add this at the *end*
<username> ALL=(ALL) NOPASSWD: ALL
```

#### zip

```shell
# compress
bzip2 file
zip file.zip <file>
zip -r file.zip <path>
gzip file


#decompress
bunzip2 file.bz2
# zsh
x <any zipped file>
```


--------------------------------

### packages


#### byobu

```shell
# help
S + F1
# create new window
F2

F3/M + Left    - Move to previous window
F4/M + Right   - Move to next window
C + F2 - Split the screen vetically
S + F2 - Split the screen horizontally
S + F3 - Move to previous split screen
S + F4 - Move to next split screen
S + Arrows - To move along splits
```
