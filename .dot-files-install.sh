#!/bin/sh
#USAGE:
rm -rf ~/.dotfiles
#git clone git@gist.github.com:4954508da71b3d830d06.git .dotfiles
rm ~/.bashrc ~/.vimrc ~/.bash_prompt
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.bash_prompt ~/.bash_prompt
ln -s ~/.dotfiles/.bashrc ~/.bashrc
