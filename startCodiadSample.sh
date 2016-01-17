#!/bin/bash


# These must be absolute paths
DATADIR="/home/me/.codiad"
WORKSPACEDIR="/home/me/"
WEBDOMAIN="example.com"
WEBURI=""

docker run -d -P \
	-v "$DATADIR:/var/www/html/data" \
	-v "$WORKSPACEDIR:/var/www/html/workspace" \
	-e "SERVICE_TAGS=urlprefix-$WEBDOMAIN/$WEBURI" \
	-e "SERVICE_NAME=codiad" \
	-e "SERVICE_80_CHECK_HTTP=/" \
	-e "SERVICE_80_CHECK_INTERVAL=5s" \
	aducastel/codiad $*
