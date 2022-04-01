#!/bin/bash


archSetup() {
	sudo pacman --noconfirm -S git

	installYay

	cd $script_path

	cat ./packages/packages.txt | grep -v ^# | xargs | yay -S --noconfirm

	updateConfigurations
}

updateConfigurations(){
	cd ~
	git clone https://github.com/JonathanGodar/.dotfiles
	cd .dotfiles

	stow -S *
}

updateConfigurations

installYay(){
	# Required for installing yay
	sudo pacman --noconfirm -S base-devel

	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg --noconfirm -si

	cd ../
}

script_path=`pwd`
archSetup
