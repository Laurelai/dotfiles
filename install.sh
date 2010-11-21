#!/bin/sh

echo "checking for requirements"
if [ ! -f `which git` ] && [ ! -f `which curl` ]
then
	if [ -x /usr/bin/apt-get ]
	then
		echo "installing requiements..."
		sudo apt-get install git-core curl
	else
		echo "could not install pre-requisites, please install them manually"
		echo "required: git curl"
		exit
	fi
else
	echo "requirements exist, proceeding to install phase..."
fi

if [ -d ~/.dotfiles ]
then
	echo "updating dotfiles..."
	cd ~/.dotfiles
	git pull
else
	echo "retrieving dotfiles..."
	cd ~
	git clone git://github.com/rrm/dotfiles.git .dotfiles
fi

echo "creating config directory..."
mkdir -p ~/.config

FILES=".vimrc .emacs .sbclrc .bashrc .profile .bash_aliases .vim .gitconfig .functions .byobu .config/awesome"
for i in $FILES; do
	echo installing: ~/.dotfiles/$i ~/$i
	rm -rf ~/$i
	ln -s ~/.dotfiles/$i ~/$i
done

echo "installation complete"

