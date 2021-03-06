#!/bin/bash
# This script gather specific functions for Void Linux

# Primary variables
pkgupdate="sudo xbps-install -Suy"
pkginstall="sudo xbps-install -y"
pkgremove="sudo xbps-remove -Ry"
rc_local="/etc/rc.local"

# Secondary variables
sshfs="fuse-sshfs"
gpg="gnupg2"
python="python3"
mutt="mutt cyrus-sasl-modules"
xorg="xorg"
screenfetch="screenFetch"
imagemagick="ImageMagick"
lts="linux-lts"
texlive="texlive-bin"
virtualbox="virtualbox-ose"
qutebrowser="qutebrowser dbus"

# Primary functions

# Secondary functions

startup () {

sudo ln -s /etc/sv/$1 /var/service

}

service () {

echo "$2" | sudo tee -a /etc/rc.local >/dev/null

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

nnn-install () {

$pkginstall nnn

}

i3-gaps-install () {

$pkginstall i3-gaps

}
