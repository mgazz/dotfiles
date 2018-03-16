

####
## in /etc/dhcp/dhcpd.conf
####
# dhcpd.conf
#
# Sample configuration file for ISC dhcpd
#

default-lease-time 600;
max-lease-time 7200;
subnet 192.168.1.0 netmask 255.255.255.0 {
        option routers                  192.168.1.1;
        option subnet-mask              255.255.255.0;
        option domain-name-servers       8.8.4.4, 8.8.8.8;
        range 192.168.1.10 192.168.1.100;
}
host apex {
   option host-name "apex.example.com";
   hardware ethernet 54:ee:75:b9:60:7b;
   fixed-address 192.168.1.1;
}
host tk1 {
   option host-name "tk1";
   hardware ethernet 00:04:4b:26:fb:96;
   fixed-address 192.168.1.10;
}

####
## Setup conf
####
# Note: can keep dhcpd disables: sudo systemctl disable dhcpd.conf
#On laptop: 
## ifconfig eth0 192.168.1.1
## sudo systemctl start dhcpd.service 


### Snippet
sudo ifconfig eth0 192.168.1.1 && \
    sudo systemctl start dhcpd.service && \
    sudo iptables-restore < \
    ~/workspace/iptables-settings/iptables-forwarding.save


