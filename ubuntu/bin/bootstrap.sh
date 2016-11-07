#! /bin/sh

if [ ! -f /usr/bin/ansible-playbook ]; then
    sudo apt-get install --yes software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install --yes ansible
    sudo apt-get install --yes python-apt
fi

sudo ansible-playbook config.yml -i localhost, --check --connection local
