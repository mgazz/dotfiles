
sudo dd bs=4M if=/tmp/2017-01-11-raspbian-jessie-lite.img of=/dev/mmcblk0

# make backup
sudo dd bs=4M if=/dev/sdb | gzip > rasbian.img.gz
# restore
gunzip --stdout rasbian.img.gz | sudo dd bs=4M of=/dev/mmcblk0
