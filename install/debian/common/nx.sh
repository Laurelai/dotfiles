#!/bin/sh

LOCATION="http://64.34.161.181/download/3.5.0/Linux"

MACHINE="i386"
if [ `uname -m` = "x86_64" ]; then
	MACHINE="amd64"
fi

NXCLIENT="nxclient_3.5.0-6_$MACHINE.deb"
NXNODE="nxnode_3.5.0-3_$MACHINE.deb"
NXSERVER="nxserver_3.5.0-4_$MACHINE.deb"

wget "$LOCATION/$NXCLIENT"
wget "$LOCATION/$NXNODE"
wget "$LOCATION/FE/$NXSERVER"

sudo dpkg -i $NXCLIENT
sudo dpkg -i $NXNODE
sudo dpkg -i $NXSERVER
sudo apt-get -f install
