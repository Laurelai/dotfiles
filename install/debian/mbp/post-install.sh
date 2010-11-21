#!/bin/sh

# broadcom wireless
echo deb http://ftp.debian.org/debian squeeze main contrib non-free >> /etc/apt/sources.list
apt-get update
apt-get -y install module-assistant wireless-tools
m-a a-i broadcom-sta
echo blacklist brcm80211 >> /etc/modprobe.d/broadcom-sta-common.conf
update-initramfs -u -k $(uname -r)
modprobe -r b44 b43 b43legacy ssb brcm80211
modprobe wl

# disable snd-pcsp
echo "blacklist snd-pcsp" >> /etc/modprobe.d/alsa-base-blacklist

# nvidia drivers
apt-get install module-assistant nvidia-kernel-common
m-a auto-install nvidia-kernel${VERSION}-source
apt-get install nvidia-glx${VERSION}
apt-get install nvidia-xconfig
nvidia-xconfig

# configure apple isight
apt-get install isight-firmware-tools
cp AppleUSBVideoSupport /root
cp /etc/rc.local /etc/rc.local.ubuntu
grep -v "exit 0" /etc/rc.local > /tmp/rc.local
cat isight-rc.local >> /tmp/rc.local
mv /tmp/rc.local /etc/rc.local
chmod 755 /etc/rc.local
source /etc/rc.local
