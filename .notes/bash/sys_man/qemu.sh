######
######
###### Qemu Networking and dhcp configuration
######
###### source: http://wiki.qemu.org/Documentation/Networking

#
#There are two parts to networking within QEMU:
#- the virtual network device that is provided to the guest (e.g. a PCI network card).
#- the network backend that interacts with the emulated NIC (e.g. puts packets onto the host's network).

#default: QEMU creates a SLiRP user network backend and an appropriate virtual network device for the guest (eg an E1000 PCI card for most x86 PC guests), 
 #--> equals to type: -net nic -net user on your command line.

#Note - if you are using the (default) SLiRP user networking, then ping (ICMP)

#Note - if you specify any networking options (via -net or -netdev) require you to provide options to define and connect up both parts.

##
## Options
##
#-netdev TYPE,id=NAME,...
#id :gives the name by which the virtual network device and the network backend are associated with each other. 
#If you want multiple virtual network devices inside the guest --> each need their own network backend. 
#The name is used to distinguish backends from each other and must be used even when only one backend is specified.

#IMPO! if you are looking to run any kind of network service or have your guest participate in a network in any meaningful way, -->
 #--> TAP is usually the best choice.

##
## Tap
##
#The tap networking backend makes use of a tap networking device in the host. 
#It offers very good performance and can be configured to create virtually any type of network topology. 

###
###
### Qemu Networking
###
### source: https://en.wikibooks.org/wiki/QEMU/Networking

#QEMU supports networking by emulating some popular network cards (NICs), and establishing virtual LANs (VLAN).

#VLAN: A virtual LAN (VLAN) is any broadcast domain that is partitioned and isolated in a computer network at the data link layer (OSI layer 2).

#There are four ways how QEMU guests can be connected then: 
#- user mode, 
#- socket redirection, 
#- Tap 
#- VDE networking

##
## User Mode
##
#is Qemu default
#example: qemu-system-i386 -m 256 -hda disk.img -netdev user,id=network0 -device e1000,netdev=network0,mac=52:54:00:12:34:56
#ICMP works only inside the vlan
#virtual DHCP server on 10.0.2.2
#DNS server on 10.0.2.3,
#SAMBA file server (if present) on 10.0.2.4

##
## Socket redirection: Redirecting ports
##
#example: -redir tcp:5555::80 -redir tcp:5556::445
#TCP port 5555 on the host is redirected to the guest's port 80
#TCP port 5556 on the host is redirected to the guest's port 445

##
## Tap intefaces
##
#TAP interfaces for full networking capability for the guest 
#example: qemu -m 256 -hda disk.img -net nic -net tap,ifname=tap0,script=no,downscript=no

##
## Before TUN/TAP need to understand BRIDGES
## source: http://www.naturalborncoder.com/virtualization/2014/10/14/understanding-bridges/
#BRIDGE: is a layer two device that is used to join two (Ethernet) networks together to form a single larger network
#package “bridge-utils” get the ability to create virtual bridges with commands such as:
brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1
#This adds two Ethernet ports “eth0” and “eth1” to the bridge. 
#If these are physical ports then this set up has linked the two networks connected to these ports at layer two and packets will flow between them
#FILTERING: the packets passing across the bridge using the user space tool “ebtables”

#REMOVE an interface and delete a bridge like this:
brctl delif br0 eth0
brctl delbr br0

#ALTERNATIVE iproute2 Bridges
ip link add br0 type bridge
ip link show
ip link set ep1 master br0
#This adds the interface ep1 to the bridge br0 (the interfaces ep1 and ep2 are just a veth pair that I’ve created for testing)
#REMOVE:
#ip link set ep1 nomaster
#ip link delete br0

##
##
## Now TUN/TAP
##
## source: http://www.naturalborncoder.com/virtualization/2014/10/17/understanding-tun-tap-interfaces/
#tun/tap: virtual interfaces
#Typically a network device in a system, for example eth0, has a physical device associated with it which is used to put packets on the wire. 
#In contrast a TUN or a TAP device is entirely virtual and managed by the kernel. 
#User space applications can interact with TUN and TAP devices as if they were real and behind the scenes the operating system will push or inject the packets into the regular networking stack as required making everything appear as if a real device is being used.

#TUN and TAP devices aim to solve different problems.

##
## TUN Interfaces
##
TUN devices work at the IP level or layer three level of the network stack and are usually point-to-point connections
typical for VPN connections since it gives the VPN software a chance to encrypt the data before it gets put on the wire.
Since a TUN device works at layer three it can only accept IP packets and in some cases only IPv4
don’t typically support broadcasting

##
## TAP
##
#work at the Ethernet level or layer two and therefore behave very much like a real network adaptor. 
#Since they are running at layer two they can transport any layer three protocol and aren’t limited to point-to-point connections.
#TAP devices can be part of a bridge
#Since TAP devices work at layer two they will forward broadcast traffic which normally makes them a poor choice for VPN connections

##
## Create tap virtual interface
##
ip tuntap add name tap0 mode tap
ip link show
#after creation the tap0 device reports that it is in the down state

##
## Creating Veth Pairs
##
#A pair of connected interfaces, commonly known as a veth pair, can be created to act as virtual wiring. 
#Essentially what you are creating is a virtual equivalent of a patch cable. 
ip link add ep1 type veth peer name ep2
#This will create a pair of linked interfaces called ep1 and ep2
#it’s common to use veth pairs to link together the internal bridges.
ip addr add 10.0.0.10 dev ep1
ip addr add 10.0.0.11 dev ep2
ping -I 10.0.0.10 -c1 10.0.0.11

