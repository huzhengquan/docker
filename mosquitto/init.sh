#!/usr/bin/env bash

cdir=`pwd`

docker run --name mosquitto \
	-p 1883:1883 \
	-p 9883:9883 \
	-v $cdir/auth-plug.conf:/etc/mosquitto.d/auth-plugin.conf:ro \
	-v $cdir/mosquitto.conf:/mosquitto/config/mosquitto.conf:ro \
	-d jllopis/mosquitto
