#!/bin/sh

# configure apple isight
cp AppleUSBVideoSupport /root
cp /etc/rc.local /etc/rc.local.ubuntu
grep -v "exit 0" /etc/rc.local > /tmp/rc.local
cat isight-rc.local >> /tmp/rc.local
mv /tmp/rc.local /etc/rc.local
chmod 755 /etc/rc.local

# install sources.list
cp /etc/apt/sources.list /etc/apt/sources.list.ubuntu
cp sources.list /etc/apt/sources.list

# install post-installation packages
dpkg -i desktop-post-install_1.0_all.deb
aptitude -fy --safe-resolver install

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
