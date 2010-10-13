#!/bin/sh

# install post-installation packages
./packages.sh

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

# special user session for gdm
cp Xsessions.desktop /usr/share/xsessions/Xsessions.desktop

# sshfs mounts
gpg fstab-sshfs.gpg
cp /etc/fstab /etc/fstab.ubuntu
cat fstab-sshfs >> /etc/fstab
rm fstab-sshfs
