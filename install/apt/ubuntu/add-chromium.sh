#!/bin/sh
# ubuntu dev repository (tracks google)
sudo add-apt-repository ppa:chromium-daily/dev
# ubuntu daily repository (automated builds, about 1 version ahead of dev)
sudo add-apt-repository ppa:chromium-daily/ppa
# install supporting packages
sudo apt-get update
sudo apt-get install moonlight-plugin-chromium chromium-codecs-ffmpeg-nonfree ubuntu-restricted-*
