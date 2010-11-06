#!/bin/sh

# start
echo "Beginning installation..."

# setup sources
cp sources.list.d/* /etc/apt/sources.list.d
apt-get update

# install post-installation packages
./packages.sh

# enable ufw
ufw enable

# configure apple isight
cp AppleUSBVideoSupport /root
cp /etc/rc.local /etc/rc.local.ubuntu
grep -v "exit 0" /etc/rc.local > /tmp/rc.local
cat isight-rc.local >> /tmp/rc.local
mv /tmp/rc.local /etc/rc.local
chmod 755 /etc/rc.local
source /etc/rc.local

# install syndaemon userland control
cp synstart /usr/bin/synstart
cp synstop /usr/bin/synstop
chmod 755 /usr/bin/synstart
chmod 755 /usr/bin/synstop

# sshfs mounts
gpg fstab-sshfs.gpg
gpg fstab-mount-points.sh.gpg
chmod 755 fstab-mount-points.sh
./fstab-mount-points.sh
rm -f fstab-mount-points.sh
cp /etc/fstab /etc/fstab.ubuntu
cat fstab-sshfs >> /etc/fstab
rm -f fstab-sshfs

# complete
echo "Installation complete: You should reboot your system"

