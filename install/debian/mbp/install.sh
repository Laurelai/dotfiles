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
apt-get install nvidia-glx${VERSION} nvidia-glx-ia32
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

# install skype on amd64
apt-get install ia32-libs ia32-libs-gtk libasound2-plugins libqt4-core lib32v4l-0 
wget -O skype-install.deb http://www.skype.com/go/getskype-linux-beta-deb 
dpkg -i --force-architecture skype-install.deb
cp ia32/lib/libwrap* /lib32
chown root:root /lib32/libwrap*
cp ia32/usr/lib/libgdbm* /usr/lib32
chown root:root /usr/lib32/libgdbm*
# video support:
#LD_PRELOAD=/usr/lib32/libv4l/v4l1compat.so skype
