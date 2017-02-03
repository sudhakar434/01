# Terminal Commands





# alias

alias  # show all alias
alias ls='ls -a'





# cron

# run job every minute
*/1 * * * * foo

# check cron log
grep CRON /var/log/syslog

# timings

# every minute
*/1 * * * * echo "job every minute"

# twice a day at 6, 18 hrs
* 6,18 * * * echo "foo"











### xargs


# on mac
ls | xargs -I {} ls {}

# ignore empty
ls | xargs -I {} cat {} -r













# disks

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

# https://help.ubuntu.com/community/InstallingANewHardDrive


# mount ntfs external hdd
sudo apt-get install ntfs-3g
sudo ntfsfix /dev/sdXX


# nfs
# nfs install package
sudo apt-get install nfs-kernel-server nfs-common
# mount
sudo mount -o soft,intr,rsize=8192,wsize=8192 <ip>:/nfs /path/to/mount

# find firmware version
ssh user@ip
cat /etc/version

# https://help.ubuntu.com/community/SettingUpNFSHowTo









### files

```shell
# sort by date/time
ls -t
ls -rt  # reverse

# replacing spaces in the file names with _
rename "s/ /_/g" * -n  # dry run
rename "s/ /_/g" *

# Lowercase all *.JPG filenames:
prename tr/A-Z/a-z/ *.JPG


# delete all directories but not files in pwd
rm -r */

# number of columns with delimiter ;
awk -F';' '{print NF; exit}' foo.txt
head -1 foo.txt | tr ';' '\n' | wc -l

# print 100th line
tail -n+100 <file> | head -n1
sed '100q;d' <file>

# find and replace text in files recursively
find /home/anand -name \*.py -exec sed -i "s/foo/bar/g" {} \;

# show foo.txt without last line
head -n -1 foo.txt

# line which is max length in file
wc -L file

# diff of files
diff <file1> <file2>

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

# generate random password
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16


# find & replace in file
sed -i 's/original/new/g' file.txt

# split file
split -b 1024 big_file small_file_prefix
split -l 1000 big_file small_file_prefix


# show files in tree format
tree
tree -Cfhpu

# run bash as sudo to append file
sudo bash -c "cat in_file >> append_file"
cat in_file | sudo tee -a append_file

# generate etags - emacs
find . -name '*.py' -exec etags -a {} \;


# increase inotify watches limit

# temp
echo 16384 > /proc/sys/fs/inotify/max_user_watches
# permanent, add this to /etc/sysctl.conf
fs.inotify.max_user_watches=16384
```





# firewall

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








# ffmpeg

# extract audio from video
ffmpeg -i foo.mp4 adandada.mp3

# convert one format to another
ffmpeg -i foo.wembm adandada.mp3

# split video of 25 seconds
ffmpeg -i input.mkv -ss 00:01:10 -t 25 output.mkv













# ftp


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







# git

# update git
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install --yes git

# configuration
git config --global user.name "username"
git config --local user.email "your.email@gmail.com"

git config --global color.ui true
git config --global color.status auto
git config --global color.branch auto
git config --global core.editor vim
git config --list
# store git credentials
git config credential.helper store


# squash last n commits
git reset --soft HEAD~n
git commit -m "Commit message"

# remove untracked files
git clean -fnd
git clean -fd

# unstage all staged changes
git reset

# discard unstaged changes
git checkout -- .


# to commit only one file
git commit -m 'my message' path/to/file.ext
# commit a part of file
git commit --patch <file_name>

# generate a git patch for a specific commit
git format-patch -1 <sha>
git format-patch -1 HEAD

# apply patch
patch -p1 < file.patch


# show all remotes
git remote -v

# create branch from remote
git branch tasks origin/tasks

# fetch all remotes
git fetch origin '+refs/heads/*:refs/remotes/origin/*'


# create gitlab remote
curl -u 'chillaranand' https://api.gitlab.com/user/repos -d '{"name":"foo"}'

# delete remote branch
git push origin :master


# checkout github pull requests locally
# add this to .git/config -> remote -> fetch
    fetch = +refs/pull/*/head:refs/remotes/origin/pr/*

git fetch origin


# push
git push master origin
git push -f master origin


# stash
git stash
git stash list
git stash apply <stash_num>
git stash pop


# alias
lg1 = log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all

# create a new branch
git checkout --orphan <branchname>
git rm --cached -r .









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

# show other linux in lan
avahi-browse -tl _workstation._tcp
avahi-browse -attr

# show ip, mac of all devices in network
sudo apt-get install arp-scan
sudo arp-scan -I wlan0 -l
sudo arp-scan --interface=eth0 --localnet
sudo arp-scan --interface=wlan0 --localnet | grep 192 | sort -V

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

sudo netstat -ntpl

# kill process running on a port 12345
fuser -k 12345/tcp

# check port 8000
sudo netstat -peant | grep ":8000 "
lsof -i :8000

# what ports are open on any machine
sudo apt-get install --yes nmap
nmap 192.168.1.33
nmap localhost

# local machine
sudo netstat -tulpn
sudo netstat -tulpn | grep LISTEN

# dns queries
nslookup avilpage.com
nslookup -querytype=mx bbc.co.uk
dig avilpage


# connect to wifi from cli
# show available wifi networks
nmcli dev wifi

# connect to a wifi
nmcli dev wifi connect 'foo bar' password 'baz'

# connect to a wifi and name it
nmcli dev wifi connect 'foo bar' password 'baz' name 'wifi1'

# connect to previous network
nmcli con up id 'wifi1'
```



# packages

# show info of packages
apt-cache show indicator-kdeconnect

# upgrade a single package
sudo apt-get install --only-upgrade <package name>

# show available versions of a package
sudo apt-cache policy <package name>
sudo apt-cache show <package name> | grep Version
sudo apt-cache madison <package name>

# remove ppa
sudo add-apt-repository --remove ppa:whatever/ppa
















# processes


# run a job in background
emacs &

# don't show output
emacs > /dev/null

# suppress error messages
emacs 2&>1 >/dev/null

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

# kill process by id
kill -9 <PID>
kill -KILL <PID>
kill -SIGKILL <PID

# kill processes by name
pkill emacs

# kill process by some identifier
ps -ef | grep 'celery' | awk '{print $2}' | xargs kill -9
pgrep celery | xargs kill -9

# show all kill signals
kill -l


# run this command with lowest priority
nice -n 19 command














# security

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


# generate csr for ssl
openssl req -new -newkey rsa:2048 -nodes -keyout foo.com.key -out foo.com.csr
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

# change brightness
echo 100 > /sys/class/backlight/foo/brightness
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



#### usb pen drive

```shell
# list block devices
lsblk

# write permissions for a pendrive
dosfsck -a /dev/sdb1

# write permissions for pen drive
sudo mount -o remount,rw /media/foo/usb-drive

# bootable usb
# write to that device
sudo dd if=ubuntu-14.04-desktop-amd64.iso of=/dev/sdc bs=4M
sudo dd if=ubuntu-14.04-desktop-amd64.iso of=/dev/sdc

# format usb pendrive
sudo fdisk /dev/sdb
o -> n -> w
sudo mkfs.vfat /dev/sdb1

# usb write permissions
df -Th
unmout /media/
dosfsck -a /dev/sdb1
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

# grep ps without grep
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

# show who is logged on and what they are doing
w
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

## third party packages
















# aws cli

# install
pip install awscli

# configure
aws configure
aws configure --profile=new



# s3
aws s3 ls

# minio
aws --endpoint-url http://0.0.0.0:9000 s3 ls

aws s3 mb s3://bucket-name
aws s3 rb s3://bucket-name
# delete non-empty bucket
aws s3 rb s3://bucket-name --force


aws s3 cp s3://foo/bar ./aws/sherlock-test
aws s3 sync s3://foo s3://bar
aws s3 sync s3://foo ./aws/foo

# get bucket size
aws s3 ls --summarize --human-readable --recursive s3://bucket

# count objects
aws s3api list-objects --bucket BUCKETNAME --output json --query "[length(Contents[])]"

# make a bucket public
# need to add a policy



#ec2
aws ec2 run-instances --image-id ami-e13739f6 --count 1 --instance-type t2.nano





### byobu

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







#  docker
docker () {}

docker images
docker ps
docker ps -a

# list only container ids
docker ps -aq
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

# suppress warning: no swap limit support
sudoedit /etc/default/grub
GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"
sudo update-grub && shutdown -r 0


### gunicorn

```shell
# run gunicorn & lot to terminal
gunicorn foo.wsgi -c g.py --log-file=-

# running gunicorn
gunicorn project.wsgi --bind 0.0.0.0:8008 --log-level debug --log-file=- --preload

```



### nginx

```apacheconf
server {

        listen 8002;

        # deny illegal host headers
        if ($host !~* ^(foo.com|www.foo.com)$ ) {
              return 444;
        }

        proxy_set_header Host $http_host;
        server_name foo.com;

        # force https redirection
        return 301 https://$server_name$request_uri;

        location  /static {
                include       /etc/nginx/mime.types;
                autoindex on;
                alias /opt/foo/collect_static;
        }

        location  /media {
                include       /etc/nginx/mime.types;
                autoindex on;
                alias /opt/foo/media;
        }

        location / {
                proxy_pass http://0.0.0.0:8001;
        }
}
```



### notedown

```shell
# https://github.com/aaren/notedown
pip install notedown

# convert markdown to ipython notebook
notedown python.md > python.ipynb
```

















# rabbitmq
sudo apt-get install rabbitmq-server


# rabbitmqctl
sudo rabbitmqctl list_users

sudo rabbitmqctl add_user <user> <pass>

# delete guest user
sudo rabbitmqctl add_user <user> <pass>


sudo rabbitmqctl list_vhosts
sudo rabbitmqctl add_vhost <my_host>

sudo rabbitmqctl set_permissions -p <vir_host> <user> ".*" ".*" ".*"

sudo rabbitmqctl list_queues
sudo rabbitmqctl list_exchanges

sudo rabbitmqctl stop_app
sudo rabbitmqctl reset
sudo rabbitmqctl start_app

# purge a queue
sudo rabbitmqctl purge_queue <queue_name>

# purge all queues
rabbitmqctl stop_app
rabbitmqctl reset    # Be sure you really want to do this!
rabbitmqctl start_app


# rabbitmq-plugins
sudo rabbitmq-plugins list
sudo rabbitmq-plugins enable rabbitmq_management








### redis

```shell
# start server
redis-server

# ping redis
redis-cli ping

# shutdown
redis-cli shutdown

# interactive redis
redis-cli

# allow remote connections
# comment `bind` option in `/etc/redis/redis.conf`
```



### salt stack

```shell
# install
sudo apt-get --yes -q install python-software-properties

# states
sudo salt '*' state.apply <state1>
sudo salt '*' state.apply <state2> saltenv=<env1> --state-output=mixed
sudo salt '*' state.highstate saltenv=<env1>
sudo salt <minion1> state.highstate saltenv=<env2>

# jobs
# Return the data on all running salt processes on the minion
sudo salt '*' saltutil.running
sudo salt-run jobs.active
# find a running job with jid
sudo salt '*' saltutil.find_job <jid>
# kill a running job with jid
sudo salt '*' saltutil.kill_job <jid>
```


### screen

```shell
screen      # enter to screen
C + a ?     # display help
CTRL + a c  # create new window
C + a k     # kill current window
C + a w     # list all windows
C + a 0 -9  # switch windows
C + a C + a # toggle windows
```


### stress

```shell
sudo apt-get install stress

# 3 cpu 100% usage for 10 seconds
stress -c 3 -t 10
```



### terminator

```shell
ctrl + shift + o - split screen horizontally
ctrl + shift + e - split screen vertically
ctrl + tab       - cycle through tabs
```


### tmux

```shell
ctrl + b % - split vertically
ctrl + b " - split window horizontally
ctrl + b arrow keys - switch panes
ctrl + b c - create new window in existing session

# list window layout
tmux list-windows
```


### xbacklight

```shell
# install x backlight
sudo apt-get install xbacklight

# xbacklighthelp
xbacklight -help

# set backlight brighness to 10
xbacklight -set 10
```


### xsel

```sh
# copy between files & clipboard
xsel -b < foo.txt
cat foo.txt | xclip -i

xsel -b > bar.txt

# share file
pastebinit foo.txt
```








# REST

# curl post with form data
curl -d "username=chillaranand&password=foo" http://192.168.0.152:8000/api/token/new.json

# httpie post with form data
http POST 0.0.0.0:8000/api/token/new.json username=f password=f -f









### heroku


```sh
heroku login

# create new app
heroku create

# add remote to existing app
heroku git:remote -a foo

# env variables
# show all
heroku config

# set env
heroku config:set DEBUG_COLLECTSTATIC=1
```



# screen recorder
kazam


# screenkey

# screenkey shows the keys pressed while screencasting
sudo apt-get install screenkey

# need to stop it from system-monitor




### JOBS & PRIORITY


    renice -20(priority) 7448(jobid) # Change priority of jobs


### IDENTIFY BOTTLENECK
    mpstat
    sar
    vmstat -s
    vmstat -m | head -5
    vmstat -f
    vmstat
    iotop
    htop


### create new user

    sudo useradd <username>
    sudo passwd <username>
    sudo adduser <username> sudo



### About hadoop:

Cost of hadoop cluster is much cheaper than MySQl cluster.
MySQL accession rate is faster than Hadoop.

For offline data processing(where customer is not interacting with data) hadoop is good solution.

when does Hadoop makes sense?
https://www.percona.com/blog/2013/07/11/mysql-and-hadoop/


Installation:

how to install single node hadoop in ubuntu?
http://askubuntu.com/questions/144433/how-to-install-hadoop

hadoop-hive
https://en.wikipedia.org/wiki/Apache_Hive

hadoop-hue
https://en.wikipedia.org/wiki/Hue_(Hadoop)

installation of hue
http://tutorialforlinux.com/2014/05/23/how-to-install-hue-hadoop-web-gui-on-ubuntu-14-04-trusty-lts-easy-guide/

hive database access
http://www.orzota.com/hive-tutorial-for-beginners/


Tutorials:
installation screencasts old: http://hadoopscreencasts.com/episodes/5



### python stuff

```sh
# upload package to pypi
python setup.py register -r pypi
python setup.py sdist upload -r pypi
```

### pip

```sh
# pip

# install from github
pip install https://github.com/user/repository/archive/branch.zip
pip install https://github.com/chillaranand/fadata/archive/master.zip

# dev install
pip install -e /package/path

# install scipy
sudo apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran
pip install scipy
```


#### simple http server

```sh
# python 2
python -m SimpleHTTPServer

# python 3
python3 -m http.server

# twistd
twistd -n web --path .
```




### mitmproxy

```sh
sudo apt-get install python-pyasn1 python-flask python-urwid python-dev libxml2-dev libxslt-dev libffi-dev
sudo pip install mitmproxy
mitmproxy
```










# android



# adb

adb devices
adb install test.apk

# restart adb as root
adb root

# reboot into fastboot mode
adb reboot bootloader

# in adb shell
mount -o rw,remount,rw /system
mount system RO: mount -o ro,remount,ro /system





# unlock bootloader

# enable developer options
# enable OEM unlock

# go to fastboot
fastboot devices
fastboot oem get_unlock_data

# use that and get key from vendor
# https://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-b

# after getting key from vendor
fastboot oem unlock D2Z6X73ZVAG4X2FSHMNQ

# reboot






# custom recovery

# download twrp by device codename
adb reboot bootloader
sudo fastboot flash recovery twrp-otus-3.0.2-r1.img
sudo fastboot reboot




# root with supersu

# install custom recovery

# download supersu and install it
adb push UPDATE-SuperSU-v2.02.zip /sdcard/UPDATE-SuperSU-v2.02.zip
# go to recovery -> install -> select supersu -> install -> reboot





# recover from bootloop

# boot to recovery mode
# advanced -> enable sideload
adb sideload UPDATE-SuperSU-v2.46.zip








# cyanogenmod


# wipe
dalvik cache,data, cache,system

# push rom
adb push -p cm-14.0-20160910-UNOFFICIAL-athene.zip /sdcard/

# download and install gapps
adb push open_gapps-arm-7.1-nano-20161217.zip /sdcard/
# reboot recovery - install zip




# factory reset with fastboot
fastboot erase system
fastboot erase userdata
fastboot erase cache




# xposed


# download xposed zip and flash
wget http://dl-xda.xposed.info/modules/de.robv.android.xposed.installer_v33_36570c.apk
adb sideload de.robv.android.xposed.installer_v32_de4f0d.apk

# download xposed apk and install it













### nikola

```sh
pip install nikola

nikola plugin -i import_blogger
nikola import_blogger ~/Downloads/blog-07-23-2016.xml

nikola theme -i base-jinja

nikola auto
nikola serve
```



### celery
```sh
celery -A apps.project.tasks worker -l info


# kill all celery workers
ps -ef | grep 'celery worker' | awk '{print $2}' | xargs kill -9


celery inspect active
```


### gsetting

```
# disable auto-opening nautilus window after auto-mount
gsettings set org.gnome.desktop.media-handling automount-open false
```







# shell scripting

# exapnsion
echo {a..z}


# for loop
for i in {1..5}; do echo "Welcome $i times"; done

# if cond













# vagrant

vagrant init
vagrant init ubuntu/xenial64
vagrant init debian/jessie64

vagrant up
vagrant up --provider=Virtualbox

vagrant ssh

vagrant reload

vagrant destroy
vagrant status
vagrant halt

vagrant global-status








# ansible
ansible() {}

ansible all -i inventory/vagrant.ini -m ping

ansible all -i inventory/vagrant.ini -m yum -a "name=ntp state=present" --sudo

ansible all -i vagrant.ini -m shell -a "pwd"

ansible-playbook -i inventory/vagrant.ini ntpd-init.yml


ansible-playbook playbook.yml -i inventory.ini --user=username --extra-vars "ansible_sudo_pass=yourPassword"







# ios

# restart ios device
idevicediagnostics restart




# tesseract
tesseract in.jpg out.txt -l tel




# hg

# remove files
hg purge
hg st -un0 | xargs -0 rm

# stash
hg shelve

# to enable add this to .hgrc
[extensions]
purge =




# pandoc
pandoc -o test.html test.md












# images

# stack images horizontally
convert +append *.png out.png

# stack images vertically
convert -append *.png out.png

# format conversion
convert foo.png foo.jpg


# pdf to png
convert -density 300 input.pdf -quality 90 prefix

pdftoppm -rx 300 -ry 300 -png a.pdf prefix













# google cloud platform - gcloud

# auth
gcloud auth application-default login

gcloud projects list


gcloud config set project avilpage-staging

gcloud config set compute/zone us-central1-a


gcloud container clusters list

# fetch data and generate kubectl entry
gcloud container clusters get-credentials "cluster-foo"


gcloud compute addresses list


gcloud compute instances list

# ssh into instance
gcloud compute ssh "server-foo"

# open a port
gcloud compute firewall-rules create <rule-name> --allow tcp:9090 --source-tags=<list-of-your-instances-names> --source-ranges=0.0.0.0/0 --description="<your-description-here>"







# kubectl

# show merged kubeconfig settings - all clusters
kubectl config view

# set cluster
kubectl config use-context local
kubectl config use-context staging


# get cluster info
kubectl cluster-info
kubectl get nodes
kubectl get pods --all-namespaces
kubectl get pods --namespace=deis



# minikube - setup kubernetes locally
minikube version

minikube start





# deis










# watchdog

# restart celery workers
watchmedo shell-command --patterns="*.py;*.html" --recursive --command='pgrep celery | xargs kill -9 && celery worker -A t'
