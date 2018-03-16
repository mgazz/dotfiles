#define array
distro=("redhat" "debian" "gentoo")

#print array elements
echo ${distro[0]}

#lenght
echo ${#distro[@]}


#loop
#
#!/bin/bash
# define array
# name server names FQDN 
NAMESERVERS=("ns1.nixcraft.net." "ns2.nixcraft.net." "ns3.nixcraft.net.")
 
# get length of an array
tLen=${#NAMESERVERS[@]}
 
# use for loop read all nameservers
for (( i=0; i<${tLen}; i++ ));
do
    echo ${NAMESERVERS[$i]}
done
