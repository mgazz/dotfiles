####
## Openstack CentOS
####
#tested: CentOS Linux 7 Core 
#kernel: 3.10.0-327.36.3.e17.x86_64


###### To clean
#ovs-vsctl del-br br-tun 
#ovs-vsctl del-br br-int 
#ovs-vsctl del-br br-ex 
#systemctl stop openvswitch.service 
#systemctl stop openvswitch-nonetwork.service 
#rm -rf /etc/openvswitch/* /etc/openvswitch/.* 
#rmmod openvswitch
#####

echo -e "LANG=en_US.utf-8\nLC_ALL=en_US.utf-8" > /etc/environment
cat /etc/environment

systemctl disable firewalld
systemctl stop firewalld
systemctl disable NetworkManager
systemctl stop NetworkManager
systemctl enable network
systemctl start network
sudo yum install -y https://rdoproject.org/repos/rdo-release.rpm
sudo yum install -y centos-release-openstack-newton
sudo yum update -y
sudo yum install -y openstack-packstack
 



#source: https://www.rdoproject.org/install/quickstart/
#install openstack with this command
#flat network: https://www.rdoproject.org/networking/neutron-with-existing-external-network/
#packstack --allinone --keystone-admin-passwd=root --provision-demo=n 

### change enp3s0 with your interface
packstack --allinone --keystone-admin-passwd=root --provision-demo=n --os-neutron-ovs-bridge-mappings=extnet:br-ex --os-neutron-ovs-bridge-interfaces=br-ex:enp3s0


#resolve problem upload images
yum remove openstack-dashboard -y
rm -rf /etc/openstack-dashboard
yum install openstack-dashboard -y
cp /etc/openstack-dashboard/local_settings /etc/openstack-dashboard/local_settings.bkp
#change in: ALLOWED_HOSTS = ['*', ]
#sed "s/horizon.example.com/*/g" /etc/openstack-dashboard/local_settings > dashboard_settings
#check changes in dashboard_settings before copying if you want
#cp dashboard_settings /etc/openstack-dashboard/local_settings

sudo reboot

####
## network 
####
#source: https://www.rdoproject.org/documentation/packstack-all-in-one-diy-configuration/

neutron net-create extnet --router:external=True
neutron subnet-create extnet --allocation-pool start=192.168.1.10,end=192.168.1.25  --gateway 192.168.1.1 --enable_dhcp=True  192.168.1.0/24
#to delete network: neutron net-delete extnet


#to delete router: neutron router-delete rdorouter
neutron router-create rdorouter

#to check: neutron net-list
#to check: neutron router-list
neutron router-gateway-set rdorouter extnet
ROUTER_NS=$(ip netns | grep router)

##private network
neutron net-create rdonet
neutron subnet-create rdonet 192.168.90.0/24
neutron router-interface-add rdorouter rdonet
### b45 is the id of the subnet created
neutron router-interface-add rdorouter b45ff688-04e1-4de6-a29b-04bbb9528bfd

neutron security-group-rule-create --protocol icmp --direction ingress default
neutron security-group-rule-create --protocol tcp --port-range-min 22 --port-range-max 22 --direction ingress default

### start vm
ip netns #check qrouter id

# checkc qrouter
ip netns exec qrouter-5d97f2b1-d138-4eb1-8c57-e8de5ce5dd67 ifconfig
ip netns exec qrouter-ac54bec1-3a3f-482e-8ab9-53cb8c1a7e22 ssh -i ./key ubuntu@$IP

## create flavor and set quotas
openstack flavor create test --ram 1024 --disk 10 --vcpu 1
openstack flavor set test --property quota:vif_outbound_average=12500 --property quota:vif_outbound_peak=12500 --property quota:vif_inbound_average=12500 --property quota:vif_inbound_peak=12500



###
## metadata issue --> just for the crack!
###
##source: http://blog.oddbit.com/2014/01/14/direct-access-to-nova-metadata/
#grep shared_secret /etc/nova/nova.conf
#nova list
#python
#hmac.new('f6942e06bea64c85','470b49ad-3fd7-45c5-bf4e-a9cf41bd9aff',hashlib.sha256).hexdigest()

####
## problem 169.254.169.254
####
#http://unix.stackexchange.com/questions/73823/whats-the-best-way-to-have-a-169-254-169-254-address-local-to-my-laptop
sudo ip addr add 169.254.169.254/8 dev lo


###in /etc/nova/nova.conf
#metadata_listen_port = 8775
#metadata_host = 192.168.1.127
#metadata_listen = 0.0.0.0
#metadata_port = 8775


