##
## install i3
##

sudo apt-get install i3

####
## i3 ricing
####
sudo apt-get install xbacklight
wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
#
unzip master.zip 
#
cp YosemiteSanFranciscoFont-master/*.ttf ~/.fonts/
# change brightness
sudo echo 200 > /sys/class/backlight/intel_backlight/brightness


####
## xterm (no!)
####
#file .Xdefaults contains xterm configuration
xrdb .Xdefaults
#
xterm 
#


####
## Add fonts and list for names
####
fc-cache -f -v
#
fc-list | grep mgazz


#
urxvt
# centos desktop vm 
vagrant init merikan/centos-7-64-desktop-puppet; vagrant up --provider virtualbox
# disable touchpad
xinput disable $(xinput list | grep DLL06E4:01 | awk '{print $6}' | awk -F "=" '{print $2}')
#

##
## whatsapp and key management
##
sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 1537994D
#
echo "deb http://dl.bintray.com/aluxian/deb stable main" | sudo tee /etc/apt/sources.list.d/whatsie.list
# to list the keys
sudo apt-key list
#
sudo apt-get update
