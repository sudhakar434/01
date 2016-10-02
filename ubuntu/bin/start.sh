#! /bin/sh

install_package()
{
    package=$1
    ppa=$2

    if dpkg --get-selections | grep -q "^$package[[:space:]]*install$" >/dev/null;
    then
        :
        # echo "$package is already installed"
    else
       if [ "$2" != "" ]; then
           sudo bash -c "add-apt-repository --yes ppa:$ppa > /tmp/foo"
       fi
       sudo bash -c "apt-fast -qq --yes install $package > /tmp/foo"
       echo "$package is installed"
    fi
}

echo "Setting up your system. Please wait..."

if [ ! -f /usr/sbin/apt-fast ]; then
    echo "Installing apt-fast..."
    install_package apt-fast saiarcot895/myppa
    sudo dpkg-reconfigure apt-fast  # configure
fi


install_package git
git config --global user.name 'chillaranand'
git config --global user.email 'anand21nanda@gmail.com'
echo "git is configured"


install_package zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
    chsh -s /usr/bin/zsh $(whoami)
fi
rm ~/.zshrc
ln -s ~/.01/ubuntu/config/zsh/zshrc ~/.zshrc
echo "zsh is configured"


# config
rm -rf ~/.config/autostart && ln -s ~/.01/ubuntu/config/autostart/ ~/.config/autostart

# shell
install_package byobu byobu/ppa
install_package tmuxinator
rm -rf ~/.tmuxinator
ln -s ~/.01/ubuntu/config/tmuxinator ~/.tmuxinator


# salt setup
# python salt/start/setup.py



# install utils
install_package arpon
# install_package banshee banshee-team/ppa
install_package clementine
install_package clipit
install_package htop
install_package nmap
install_package npm
install_package synapse synapse-core/ppa
install_package tree
install_package unzip
install_package vlc
install_package xcape
install_package xclip



install_package compizconfig-settings-manager
install_package compiz-plugins-extra
install_package dconf-tools
install_package unity-tweak-tool freyja-dev/unity-tweak-tool-daily




# dropbox
if [ ! -f ~/.dropbox-dist/dropboxd ]; then
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd
    echo "dropbox is installed"
fi
echo "dropbox is already installed"


# chrome
if [ ! -f /usr/bin/google-chrome ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
    install_package google-chrome-stable
    echo "chrome is installed"
fi
echo "chrome is already installed"


# install emacs
if [ ! -f /usr/bin/emacs ]; then
    sudo add-apt-repository --yes ppa:ubuntu-elisp/ppa
    sudo apt-fast -qq --yes install emacs-snapshot emacs-snapshot-el
    git clone https://github.com/chillaranand/.emacs.d.git
fi
if [ ! -d ~/.emacs.d ]; then
    ln -s ~/.01/ubuntu/config/emacs ~/.emacs.d
fi
touch ~/.emacs.d/custom.el
touch ~/.emacs.d/.private.el
echo "emacs is configured"




# python
install_package python-dev
install_package python3-dev
install_package python-pip

sudo -H pip install --upgrade pip -q
sudo -H pip install --upgrade virtualenvwrapper -q
sudo -H pip install --upgrade thefuck -q


install_package libxml2-dev
install_package libxslt1-dev
# sudo pip install pillow

install_package libffi-dev
# sudo pip install cairocffi

install_package graphviz
install_package libgraphviz-dev
install_package pkg-config
# sudo pip install pygraphviz

sudo pip install --upgrade stdlib_list





# fix gtk bug
install_package gtk2-engines-pixbuf

# mitmproxy
# install_package libevent-dev

ln -s ~/.01/python/ipython_config.py ~/.ipython/profile_default/ipython_config.py

echo "pip and python packages updated"


# npm packages





# crontab -u chillaranand < ~/.01/ubuntu/config/cron_jobs.sh












# usual software

# android connect
# install_package mtpfs


# essentials
# sudo apt-get install --yes -qq build-essential libevent-dev
# sudo apt-get install --yes -qq libncurses5-dev gcc libffi-dev
# sudo apt-get install --yes -qq libxml2-dev libxslt1-dev libssl-dev
# sudo apt-get install -yqq libpq-dev libjpeg-dev libblas-dev liblapack-dev libatlas-base-dev gfortran

# posgres
# sudo apt-get install -y -qq postgresql postgresql-contrib


# mysql
# install_package mysql-server



# paper theme
# sudo rm -rf /usr/share/themes/Paper
# sudo rm -rf ~/.local/share/themes/Paper
# git clone https://github.com/snwh/paper-gtk-theme.git ~/sandbox/paper-gtk-theme
# cd ~/sandbox/paper-gtk-theme/
# ./install-gtk-theme.sh
# gsettings reset org.gnome.desktop.interface gtk-theme
# gsettings reset org.gnome.desktop.wm.preferences theme
# gsettings set org.gnome.desktop.interface gtk-theme "Paper"
# gsettings set org.gnome.desktop.wm.preferences theme "Paper"



# other packages

# install_package arp-scan

# tuxcut
# install_package dsniff
# install_package arptables
# install_package wondershaper
# install_package python-qt4

# ulogme
# sudo apt-get install xdotool wmctrl
# git clone https://github.com/karpathy/ulogme.git ~/sandbox/ulogme
# cd ~/sandbox/ulogme/
# cp render/render_settings_example.js render/render_settings.js
# ./ulogme.sh


# arbtt
# sudo apt-get install arbtt
# cp /usr/share/doc/arbtt/examples/arbtt-capture.desktop ~/.config/autostart/


# flux
# sudo apt-get install git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1 -y
# sudo pip install https://github.com/xflux-gui/xflux-gui/archive/master.zip


# install_package digikam


# install_package automake
# install_package autoconf
# git clone https://github.com/facebook/watchman.git /tmp/watchman
# cd /tmp/watchman
# ./autogen.sh
# ./configure
# make
# sudo make install


# install_package libimobiledevice-dev pmcenery/ppa


# android studio

install_package android-studio maarten-fonville/android-studio

# install_package ubuntu-make
# umake android



# install java
# sudo add-apt-repository ppa:webupd8team/java
# sudo apt-get update
# sudo apt-get install oracle-java8-installer
# sudo apt-get install oracle-java7-installer

# set java version
# sudo update-alternatives --config java


# sudo apt-get update
# sudo apt-get install postgresql postgresql-contrib


# configure locales
# sudo dpkg-reconfigure locales

# install_package calibre



# gui
# all settings -> keyboard -> auto hide the launcher
# terminal -> edit -> preferences -> shortcuts -> Ctrl + V
# clip it settings


# android adb, fastboot
# sudo add-apt-repository ppa:phablet-team/tools && sudo apt-get update
# sudo apt-get install android-tools-adb android-tools-fastboot


# sound wire
# install_package pavucontrol
# install_package libasound-dev
# install_package portaudio19-dev
# install_package libcurl4-openssl-dev
# install_package pulseaudio
# install_package gstreamer0.10-pulseaudio




# install atom
# install_package atom webupd8team/atom
# install atom package
# apm install atom-pair


# install cask
curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python


# phantomjs
# sudo apt-get install -y build-essential chrpath libssl-dev libxft-dev
# sudo apt-get install -y libfreetype6 libfreetype6-dev
# sudo apt-get install -y libfontconfig1 libfontconfig1-dev
# cd ~
# export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
# wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
# sudo tar xvjf $PHANTOM_JS.tar.bz2
# sudo mv $PHANTOM_JS /usr/local/share
# sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
