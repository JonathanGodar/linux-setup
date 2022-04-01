#!/bin/bash


archSetup() {
	sudo pacman -S --noconfirm git

	installYay
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
	sudo pacman -S --noconfirm base-devel

	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si

	cd ../
}

script_path=`pwd`
archSetup
