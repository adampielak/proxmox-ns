# proxmos-ns

Ubuntu 20.04 Proxmox VM running DNS/DHCP services

## Installation

VM setup in Proxmox:

run the following

``` shell
bash <(curl -s https://raw.githubusercontent.com/shepner/proxmox-ns/master/setup/create-vm.sh)
```

install Ubuntu 20.04 the usual way.

provide a static IP address

install OpenSSH

## Fix the UID

First set the permissions of the home dir:

``` shell
sudo chown -R 1001 /home/`id -un`
```

Then change the UID accordingly in the passwd files:

``` shell
sudo vipw
```

Finally, logout and back in again

## Setup ssh keys

Do this from the local workstation:

``` shell
DHOST=d01
ssh-copy-id -i ~/.ssh/shepner_rsa.pub $DHOST

scp ~/.ssh/shepner_rsa $DHOST:.ssh/shepner_rsa
scp ~/.ssh/shepner_rsa.pub $DHOST:.ssh/shepner_rsa.pub
scp ~/.ssh/config $DHOST:.ssh/config
ssh $DHOST "chmod -R 700 ~/.ssh"
```

## Configure the system

``` shell
git clone https://github.com/shepner/docker-ubuntu.git

cd ~/docker-ubuntu/setup
chmod 774 *.sh

./userConfig.sh
./systemConfig.sh
./nfs.sh
./docker.sh
```
