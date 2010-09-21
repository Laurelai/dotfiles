#!/bin/sh
gnome-screensaver &
nautilus --no-desktop &
chromium-browser --user-data-dir=/home/lune/.config/chromium/rm &
chromium-browser --user-data-dir=/home/lune/.config/chromium/lune &
audacious &
skype &
gnome-volume-control-applet &
nm-applet &
pkill -9 syndaemon &
synclient TouchpadOff=1 &
exec /usr/bin/awesome
