
# Giving not root access
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
#log into a new group
newgrp docker


#print port - associated port
docker inspect --format='{{range $index, $element := .NetworkSettings.Ports}}
{{$index}} - {{$element}}
{{end}}
' $(docker ps -l -q)

#good way exploring
EXPOSED_PORT=$(docker inspect --format='{{range $port_index, $element := .NetworkSettings.Ports}}{{range $element}}{{.HostPort}}{{end}}{{end}}' $(docker ps -l -q))
echo exposed service port: $EXPOSED_PORT

#start application
docker-compose up -d base

docker-compose scale base=2




####
## Vagrant and Consul
####

consul-template -consul 10.100.192.200:8500 -template "nginx-upstreams.ctmpl:nginx-upstreams.conf" -once


ssh vagrant@10.100.192.200 'docker kill -s HUP nginx'


