summit: https://www.youtube.com/watch?v=-xsvYo0_cZg

rackspace powered by python --> nasa private cloud platform --> opensource

from physical server to just resources
never have to talk to an operator
very loosely coupled architecture --> everything runs on api --> no microservices but same approach

goal: deliver self-servivce it resources rapidly at scale --> let developer work really fafst --> at scale

consumption models
public
private cloud
private cloud as a service --> single tenant but managed by other --> consumed as private cloud but managed by others

learning openstack
- openstack foundation
- cookbook --> use vagrant
- openstack essentials --> wait second edition

practical
rdo --> what comes from upstreme --> same stuff??
rdo --> vanilla openstack
rdoproject.org --> lots of documentation

keystone --> identity --> login user and components
glance --> image manager --> load image prebuilt
openstack networking --> neutron --> virtual network
nova (compute) --> take all piececs and lauch the vm
once up and running --> elastic --> vm disposable --> disk ephimeral --> cinder to attach persistence datas
swift --> object storage ---> key/value store 
horizon (dashboard)

