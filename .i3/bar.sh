#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :22.01.17
#notes           :
#==============================================================================


while true; do

ram=$(free -hm | awk 'NR==2{printf "%s/%s", $3,$2 }')
swp=$(free -hm |awk 'NR==3 {printf "%s/%s", $3,$2}')


#disk available 
disk_avail=$(df -ht ext4 | awk 'FNR == 2 {print $4}')


#currently used ip
ip=$(ip route get 1 | awk '{print $NF;exit}')
ssid=$(iwgetid -r)
if [ "$ssid" = "" ]; then
    #find wire symbol
    net=":$ip"
else
    net=" $ssid❯$ip"
fi

#battery power
battery="$(cat /sys/class/power_supply/BAT0/capacity)"

((bat=$battery/20))

battery="$battery%:"

#for ((i = 0; i < $bat; i++)); do echo -en "♥"; done
for ((i = 0; i < $bat; i++)) 
do 
    battery="$battery♥"
done

#for ((i = 0; i < (5-$bat); i++)); do echo -en "♡"; done
for ((i = 0; i < (5-$bat); i++))
do
    battery="$battery♡"
done

battery="$battery${NC}"

date=$(date +%Y-%m-%d\ %H:%M:%S)

#echo -en "| ram:$ram | swp: $swp"
#echo -en " |  :$disk_avail"
#echo -en "$net"
#echo -en "$battery%:"
#echo -en " | $date"

echo -e " ram:$ram ❯ swp: $swp ❯  :$disk_avail ❯ $net ❯ $battery ❯ $date"

sleep 3

done


