#!/bin/bash
# This script gather specific functions for Arch Linux

# Primary variables
pkgupdate="sudo pacman -Syu"
pkginstall="sudo pacman -S"
pkgremove="sudo pacman -Rs"
rc_local="/usr/local/sbin/rc.local"

# Secondary variables
sshfs="sshfs"
gpg="gnupg"
python="python"
mutt="mutt"
xorg="xorg xorg-xinit xorg-setxkbmap ttf-dejavu"
screenfetch="screenfetch"
imagemagick="imagemagick"
virtualbox="virtualbox"
qutebrowser="qutebrowser"

# Primary functions

# Secondary functions

startup () {

sudo systemctl enable $1

}

setup () {

echo "alias paclog='cat /var/log/pacman.log | grep PACMAN'" >> ~/.bashrc+

}

logo () {

sudo cp dotfiles/arch-logo /etc/issue

}

rclocal () {

sudo cp dotfiles/rc.local /usr/local/sbin/
sudo cp dotfiles/rc-local.service /etc/systemd/system
$startup rc-local

}

nnn-install () {

git clone https://aur.archlinux.org/nnn.git
cd nnn
makepkg -si
cd ..
mv nnn ~/Repositories

}

i3-gaps-install () {

git clone https://aur.archlinux.org/i3-gaps.git
cd i3-gaps
makepkg -si
cd ..
mv i3-gaps ~/Repositories

}
