#!/usr/bin/bash

if [ "$#" == 2 ];then
	TTY=$1
else
	TTY="/dev/ttyUSB0"
fi

docker run -ti --rm --net=host --cap-add=NET_ADMIN -e DISPLAY=$DISPLAY -v share:/root/share -v /tmp/.X11-unix:/tmp/.X11-unix  --device=$TTY docker-killerbee
