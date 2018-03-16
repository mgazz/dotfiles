# I dont want to type the password every 10 minutes
sudo bash -c 'echo "$(logname) ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)'

#--------------------------------

##
## mount hard disk at boot
##
# get UUID of hd
sudo blkid /dev/sda1
#in /etc/fstab
UUID="f8d21804-9bc5-42ea-abd8-db3f617bd6d4"     /media/evo      defaults
0       1
#validate /etc/fstab
sudo mount -a
#--------------------------------

###
### User and access management
###
#1 create user without sudo access
sudo useradd common
#to remove: sudo userdel -r common

#2 set key for accessing for that user

mkdir -p $HOME/keys
#do I need this? chmod 0700 $HOME/keys

#-t rsa : Specifies the type of key to create. The possible values are “rsa1” for protocol version 1 and “dsa”, “ecdsa”, “ed25519”, or “rsa” for protocol version 2.
#-b 4096 : Specifies the number of bits in the key to create
#-f ~/.ssh/vps-cloud.web-server.key : Specifies the filename of the key file.
#-C "My web-server key" : Set a new comment.

ssh-keygen -t rsa -b 4096 -f ~/keys/common.key -C "common"

sudo mkdir -p /home/common/.ssh

sudo chmod 0700 /home/common/.ssh

#sudo chown common:common ~/keys/common-key.pub
#if local
sudo cp ~/keys/common-key.pub /home/common/.ssh/authorized_keys

sudo chown -R common:common /home/common/.ssh

#if remote -_> ip: 192.168.1.10
ssh-keygen -R 192.168.1.10
#
cat ~/keys/tk1.key.pub | ssh ubuntu@192.168.1.10 'umask 0077; mkdir -p .ssh; cat >> .ssh/authorized_keys && echo "Key copied"'

#su - common to enter common user and check

#on local
scp mgazz@192.168.1.127:/home/mgazz/keys/common-key .

ssh -i common-key common@192.168.1.127

##TODO: insert in config
echo "
Host centcommon
  HostName 192.168.1.127
  User common
  #Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile "/home/mgazz/keys/common-key"
  IdentitiesOnly yes
  LogLevel FATAL
" >> ~/.ssh/config

ssh centcommon

### copy build stuff on server


#3 remove access through password

#4 try to install stuff without sudo access

#5 create daemon for both

#6 try to start server daemon user mode without sudo
#--------------------------------


###
## Sending messages to other users
###
sudo wall -n hi

#if you know the user --> seach for user
w
# send message to the user
sudo echo "Let's have a lungh... " > /dev/pts/4
#--------------------------------


##
## set transmission
##

cd /var/lib/transmission-daemon/.config
sudo mkdir -p /media/evo/complete /media/evo/incomplete
chown debian-transmission:debian-transmission /media/evo/complete /media/evo/incomplete
#--------------------------------
