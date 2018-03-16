##
## Ipvanish configuration
##

wget https://www.ipvanish.com/software/configs/configs.zip
#
wget https://www.ipvanish.com/software/configs/ca.ipvanish.com.crt
#
wget https://www.ipvanish.com/software/configs/ipvanish-IT-Milan-lin-c01.ovpn

cat "
usr_name
psw
" > credentials.txt

credentials_file=$(cat ipvanish-IT-Milan-lin-c01.ovpn.1 | grep auth-user-pass | awk '{print $2}')

# change credential passwords and path certificate
if [ "$credentials_file"="" ]; then
    sed 's/auth-user-pass/auth-user-pass\ \/home\/pi\/credentials.txt/g' ipvanish-IT-Milan-lin-c01.ovpn > ipvanish-IT-Milan-lin-c01.ovpn
    sed 's/ca/ca\ \/home\/pi\/ca.ipvanish.com.crt/g' ipvanish-IT-Milan-lin-c01.ovpn > ipvanish-IT-Milan-lin-c01.ovpn
fi

sudo openvpn --config ipvanish-IT-Milan-lin-c01.ovpn
#
