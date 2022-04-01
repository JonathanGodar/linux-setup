#!/bin/bash


archSetup() {
	echo "-> Installing git"
	sudo pacman --noconfirm -S git

	echo "-> Installing yay"
	installYay
	echo "-> Yay Installed"

	cd $script_path

	echo "-> Installing all packages from \"packages.txt\""
	cat ./packages/packages.txt | grep -v ^# | xargs yay -S --noconfirm

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
