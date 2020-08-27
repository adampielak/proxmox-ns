#!/bin/sh

REPO=shepner/proxmox-ns

if [ -d ~/scripts ]; then
  sudo rm -R ~/scripts
fi

git clone https://github.com/$REPO.git ~/scripts

chmod -R 754 ~/scripts/*.sh

mv ~/scripts/*.sh ~
