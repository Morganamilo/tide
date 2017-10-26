#!/bin/bash
# This script gather specific functions for Arch Linux

# Primary variables
pkgupdate="sudo pacman -Syu --noconfirm"
pkginstall="sudo pacman -S --noconfirm"
pkgremove="sudo pacman -Rs --noconfirm"
rc_local="/usr/local/sbin/rc.local"

# Secondary variables
sshfs="sshfs"
gpg="gnupg"
python="python"
mutt="mutt"
newsboat="newsboat"
xorg="xorg xorg-xinit xorg-setxkbmap ttf-dejavu"
screenfetch="screenfetch"
imagemagick="imagemagick"
lts="linux-lts linux-lts-headers"
virtualbox="virtualbox"
qutebrowser="qutebrowser"

# Primary functions

# Secondary functions

aur () {
	cat PKGBUILD
	read -p "Is everything okay with this PKGBUILD? Can I proceed? (y/n)?" CHOICE
	case "$CHOICE" in
		Y|y|yes ) makepkg -si;;
		N|n|no ) echo "Alright. This package's installation will be skipped for now";;
		* ) echo "Invalid answer. Please try again"
		    sleep 1.5
		    aur;;
	esac
}

startup () {

sudo systemctl enable $1

}

service () {

sudo cp dotfiles/example.service /etc/systemd/system/$1.service
sudo sed -i "s/service/$2/g" /etc/systemd/system/$1.service
startup $1

}

setup () {

# Enables dhcpcd at startup
startup dhcpcd

# Creates paclog alias for easy access to pacman´s log file
echo "alias paclog='cat /var/log/pacman.log | grep PACMAN'" >> ~/.bashrc+

}

nnn-install () {

git clone https://aur.archlinux.org/nnn.git
cd nnn
aur
cd ..
mv nnn ~/Repositories

}

i3-gaps-install () {

git clone https://aur.archlinux.org/i3-gaps.git
cd i3-gaps
aur
cd ..
mv i3-gaps ~/Repositories

}
