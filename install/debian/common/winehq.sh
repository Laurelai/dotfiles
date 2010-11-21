#!/bin/sh
cp /etc/apt/sources.list /etc/apt/sources.list~
echo "deb http://www.lamaresh.net/apt squeeze main" >> /etc/apt/sources.list
wget -O - http://www.lamaresh.net/apt/key.gpg | apt-key add -
apt-get update
apt-get install wine
update-binfmts --install wine /usr/bin/wine --extension exe
