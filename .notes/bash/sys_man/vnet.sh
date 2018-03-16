##
## setup virtual network
##
TAP: The user-space application/VM can read or write an ethernet frame to the tap interface and it would reach the host kernel, where it would be handled like any other ethernet frame that reached the kernel via physical (e.g. eth0) ports. You can potentially add it to a software-bridge (e.g. linux-bridge)
VETH: Typically used when you are trying to connect two entities which would want to "get hold of" (for lack of better phrase) an interface to forward/receive frames. These entities could be containers/bridges/ovs-switch etc. Say you want to connect a docker/lxc container to OVS. You can create a veth pair and push the first interface to the docker/lxc (say, as a phys interface) and push the other interface to OVS. You cannot do this with TAP.

# pair virt eth vetha:vethb
sudo ip link add dev vetha type veth peer name vethb
# bring up vetha
sudo ip link set dev vetha up
#
sudo ip tuntap add tapm mode tap
# add bridge brm
sudo ip link add brm type bridge
# add vetha to brm
sudo ip link set vetha master brm
# add ip to bridge 
sudo ip addr add 10.0.0.1/24 dev brm
# add ip to vethb
sudo ip addr add 10.0.0.3/24 dev vetha
# bring up brm
sudo ip link set brm up
# bring up vethb
sudo ip link set vethb up
#
ip route show
#
# create namespace nn 
sudo ip netns add nn
# move veth inteface vethb to namespace nn
sudo ip link set vethb netns nn
# open terminal
sudo ip netns exec nn xterm
# bring up dev lo in namespace nn
sudo ip netns exec nn ip link set dev lo up
# ??
sudo iptables -t nat -A POSTROUTING -o brm -j MASQUERADE
# ??
sudo iptables -t nat -A POSTROUTING -o enx00e04c681125 -j MASQUERADE
# add ip to vethb
sudo ip addr add 10.0.0.2/24 dev vethb
# bring up vethb
sudo ip link set dev vethb up
# add route (ip bridge)
sudo ip route add default via 10.0.0.1

# remove
sudo ip link set dev vetha down
sudo ip link set dev vethb down
sudo ip link del dev vetha type veth peer name vethb
#
sudo ip tuntap del tapm mode tap
#
sudo ip link set enx00e04c681125 nomaster
#
sudo ip link del brm type bridge

