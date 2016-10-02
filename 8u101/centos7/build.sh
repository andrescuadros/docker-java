#!/bin/sh
# remove previous images and containers
docker ps -a | grep acs/java:8u101-centos7 | awk '{print $1}' | xargs docker rm -f
docker rmi -f acs/java:8u101-centos7

# build the image
docker build --tag="acs/java:8u101-centos7" .


