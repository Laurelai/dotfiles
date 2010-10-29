#!/bin/sh

APT="apt-get install ${1}"

echo "Installing Package Sets..."

echo "Base Packages"
$APT git-core curl tig isight-firmware-tools ufw ngrep nmap vim sshfs proxychains dvtm dtach rlwrap emacs emacs-goodies-el ruby-elisp

echo "Desktop packages"
$APT gufw skype chromium-browser cheese simple-ccsm awesome audacious vlc electricsheep rxvt-unicode xserver-xephyr feh flpsed

echo "Virtualization"
$APT virtualbox-ose

echo "Gaming packages"
$APT wine playonlinux

echo "Recording Studio"
$APT lmms lmms-vst buzztard buzztard-bsl csound easytag audacity lame

echo "Development"
$APT  build-essential sbcl gcl ecl bnfc antlr3 flex bison ruby irb rake rdoc rubygems lemon uthash-dev gperf
