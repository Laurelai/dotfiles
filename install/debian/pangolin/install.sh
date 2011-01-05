#!/bin/sh

# radeon non-free
apt-get -y install linux-headers-2.6-$(uname -r | sed 's,.*-,,') fglrx-control fglrx-driver

# RTL8192SE driver
#http://www.realtek.com/downloads/downloadsView.aspx?Langid=1&PNid=48&PFid=48&Level=5&Conn=4&DownTypeID=3&GetDown=false&Downloads=true#2302
tar -xzvf rtl8192se_linux_2.6.0019.1207.2010.tar.gz
cd rtl8192*
make
make install
