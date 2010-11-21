#!/bin/sh
deb http://www.lamaresh.net/apt squeeze main
wget -O - http://www.lamaresh.net/apt/key.gpg | apt-key add -
apt-get update
apt-get install wine
