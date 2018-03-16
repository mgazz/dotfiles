#For sample
for i in $( ls ); do
    echo item: $i
done

#C-like for
for i in `seq 1 10`;
do
    echo $i
done

#While sample
COUNTER=0
while [  $COUNTER -lt 10 ]; do
    echo The counter is $COUNTER
    let COUNTER=COUNTER+1 
done

#Until sample
COUNTER=20
until [  $COUNTER -lt 10 ]; do
    echo COUNTER $COUNTER
    let COUNTER-=1
done

#Infinite loop
while true; do echo 'Hit CTRL+C'; sleep 1; done

#Infinite loop rewrite on same line
while true; do echo -ne "hello\033[0K\r"; sleep 2; echo -ne "ciao\033[0K\r"; sleep 2;done

