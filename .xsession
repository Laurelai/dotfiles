#!/bin/sh
gnome-screensaver &
google-chrome &
audacious &
skype &
gnome-volume-control-applet &
nm-applet &
pkill -9 syndaemon &
synclient TouchpadOff=1 &
exec /usr/bin/awesome
