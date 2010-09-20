#!/bin/sh
if [ -x /usr/bin/apt-get ]
then
	sudo apt-get install git-core curl
fi	
cd ~
rm -rf ~/.dotfiles
git clone git://github.com/rrm/dotfiles.git .dotfiles
rm -f ~/.vimrc ~/.bashrc ~/.profile ~/.bash_aliases ~/.vim ~/.screenrc ~/.functions ~/.xsession
rm -rf ~/.config/awesome
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.profile
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.screenrc ~/.screenrc
ln -s ~/.dotfiles/.functions ~/.functions
ln -s ~/.dotfiles/.xsession ~/.xsession
ln -s ~/.dotfiles/.config/awesome ~/.config/awesome
