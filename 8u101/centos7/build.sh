#!/bin/sh
# remove previous images and containers
docker ps -a | grep acs/java:8u101-centos | awk '{print $1}' | xargs docker rm
docker rmi -f acs/java:8u101-centos

# build the image
docker build --tag="acs/java:8u101-centos" .


