#!/bin/sh
if [ -x /usr/bin/apt-get ]
then
	sudo apt-get install git-core curl
fi	
cd ~
rm -rf ~/.dotfiles
git clone git://github.com/rrm/dotfiles.git .dotfiles
rm ~/.bashrc ~/.vimrc ~/.bash_prompt ~/.bash_aliases ~/.profile
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.profile
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.screenrc ~/.screenrc
ln -s ~/.dotfiles/.functions ~/.functions
