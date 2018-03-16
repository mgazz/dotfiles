####
## Proxy definition
###
docker network create my-network
#
docker network create -d overlay my-network
#
curl http://10.100.192.200:8500/v1/catalog/services
#

####
## speech speaker
####
docker run --name espeakbox -d -p 8080:8080 parente/espeakbox

curl http://localhost:8080/speech?text=the%20cheese%20flies%20at%20midnight > test.mp3 && mpg123 test.mp3


###
## Inspect data
###
#
docker inspect --format='{{(index (index .NetworkSettings.Ports "2222/tcp") 0).HostPort}}' $(docker ps -l -q)
#
consul-template -consul 10.100.192.201:8500 -template "nginx-upstreams.ctmpl:nginx-upstreams.conf" -once
#

#####
## Docker performance
####
mkdir testimage
#
openssl enc -aes128 -in /dev/zero -out >(dd bs=64K count=16384 iflag=fullblock of=testimage/data.img) -e -k $RANDOM -bufsize 134217728
#
echo "FROM scratch" > testimage/Dockerfile
#
echo "ADD data.img /data.img" >> testimage/Dockerfile
#
/usr/bin/time docker build -t testimage testimage
#
docker tag testimage localhost:5000/testimage
#
/usr/bin/time docker push localhost:5000/testimage
#
cd testimage/
#
time sha1sum data.img
#
time sha256sum data.img
#
head -n1 /etc/issue
#
uname -a
#
cat /proc/cpuinfo | grep "model name" | cut -d ':' -f 2 | sort | uniq -c
#
free -h
#
docker info | grep -i "pool\|metadata\|thin"
#
cd ..
#
/usr/bin/time docker build -t testimage testimage
#
/usr/bin/time docker push localhost:5000/testimage
#
sudo apt-get install pv
#
tar cf - -C ~/workspace/gocode/src/github.com/docker/docker . | pv > /dev/null




