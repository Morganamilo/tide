#!/bin/bash
# This script gather specific functions for Arch Linux

# Primary exports
export pkgupdate="sudo pacman -Syu"
export pkginstall="sudo pacman -S"
export pkgremove="sudo pacman -Rs"
export rc_local="/usr/local/sbin/rc.local"

# Secondary exports
export sshfs="sshfs"
export gpg="gnupg"
export python="python"
export mutt="mutt"
export xorg="xorg xorg-xinit xorg-setxkbmap ttf-dejavu"
export screenfetch="screenfetch"
export imagemagick="imagemagick"
export virtualbox="virtualbox"
export qutebrowser="qutebrowser"

# Primary functions

# Secondary functions

startup () {

sudo systemctl enable $1

}

setup () {

echo "No specific distro configuration. Proceeding..."

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
