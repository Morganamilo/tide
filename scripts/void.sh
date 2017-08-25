#!/bin/bash
# This script gather specific functions for Void Linux

# Primary exports
export pkgupdate="sudo xbps-install -Suv"
export pkginstall= "sudo xbps-install"
export pkgremove="sudo xbps-remove -R"
export rc_local="/etc/rc.local"

# Secondary exports
export sshfs="fuse-sshfs"
export gpg="gnupg2"
export python="python3"
export mutt="mutt cyrus-sasl-modules"
export xorg="xorg"
export screenfetch="screenFetch"
export imagemagick="ImageMagick"
export virtualbox="virtualbox-ose"
export qutebrowser="qutebrowser dbus"

# Primary functions

# Secondary functions

startup () {

sudo ln -s /etc/sv/$1 /var/service

}

setup () {

# Disables unused TTYs
sudo rm -r /var/service/agetty-tty2
sudo rm -r /var/service/agetty-tty3
sudo rm -r /var/service/agetty-tty4
sudo rm -r /var/service/agetty-tty5
sudo rm -r /var/service/agetty-tty6

# Disables SSH daemon (it is enabled by default on Void)
sudo rm -r /var/service/sshd

}

logo () {

sudo cp dotfiles/void-logo /etc/issue

}

rclocal () {

sudo cp dotfiles/rc.local /etc/

}

nnn-install () {

$pkginstall nnn

}

i3-gaps-install () {

$pkginstall i3-gaps

}
