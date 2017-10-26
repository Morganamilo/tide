#!/bin/bash
# This script gather most general purpose functions

# Calls distro specific variables and functions
echo "Please input which distribution you are currently using, the name should be one of the below options, use only lowercase letters"
ls scripts/distro | sed 's/\(.*\)\..*/\1/'
read -p "Distribution:" DISTRO
source scripts/distro/$DISTRO.sh

# Syncs the distro repositories to ensure packages will download correctly
$pkgupdate &&

core () {

# Creates essential directories
mkdir ~/.config
mkdir ~/Public
mkdir ~/Repositories
mkdir ~/Scripts
mkdir ~/Templates
mkdir ~/USB

# Copies core dotfiles
cd dotfiles
cp .bashrc .tmux.conf .vimrc ~/
cp -r .gnupg ~/
cp -r .config/ranger ~/.config/ranger
cd ..

# Implements extra keys
# Essential for Control and Shift keyboard commands on a no-GUI system
sudo cp dotfiles/extrakeys /etc/
service extrakeys "loadkeys /etc/extrakeys"

# Implements your distribution logo at startup
sudo cp dotfiles/$DISTRO-logo /etc/issue

# Implements mount permissions for your normal user
echo "/dev/sdb1	/home/$USER/USB	ext4,btrfs,ntfs,vfat user,noauto" | sudo tee -a /etc/fstab >/dev/null

# Does some distro specific configuration if there is any
setup

# Installs core packages
$pkginstall base-devel alsa-utils dosfstools bc zip unzip wget htop iftop iotop powertop nethogs rkhunter vim ranger tmux rsync openssh $sshfs $gpg $python

# Installs nnn using custom method depending on the distribution
nnn-install

}

cli () {

# Creates general user directories
mkdir ~/Code
mkdir ~/Documents
mkdir ~/Downloads
mkdir ~/Mail
mkdir ~/Pictures
mkdir ~/Pictures/Screenshots
mkdir ~/Programs
mkdir ~/Videos

# Copies important documents to the system
cp 'Cheatsheet' 'Packages' ~/Documents

# Copies CLI dotfiles
cp -r dotfiles/.config/ranger ~/.config
cp -r dotfiles/.elinks ~/
cp -r dotfiles/.mutt ~/
cp -r dotfiles/.newsbeuter ~/

# Installs CLI packages
$pkginstall elinks mutt $newsboat irssi calcurse cmatrix

}

torrent () {

# Creates torrent directories
mkdir ~/Torrents
mkdir ~/Torrents/.session

# Copies torrent dotfiles
cp dotfiles/.rtorrent.rc ~/

# Installs torrent packages
$pkginstall rtorrent

}

music () {

# Copies music dotfiles
cp -r dotfiles/.config/mpd ~/.config
cp -r dotfiles/.ncmpcpp ~/

# Creates music directories
mkdir ~/Music
mkdir ~/.playlists

# Installs music packages
$pkginstall mpd ncmpcpp

}

youtube-dl () {

# Installs youtube-dl
$pkginstall youtube-dl

}

firewall () {

# Installs ufw and enable it at startup
$pkginstall ufw
startup ufw

}

powersaving () {

# Installs tlp and enable it at startup
$pkginstall tlp
startup tlp

}

gui () {

# Creates GUI directories
mkdir ~/.wallpapers

# Copies GUI dotfiles
cd dotfiles
cp .i3status.conf .xinitrc .Xresources ~/
cp -r .config/i3 ~/.config
cd ..

# Installs GUI packages
$pkgremove vim
$pkginstall w3m $xorg i3status i3lock dmenu rxvt-unicode scrot $screenfetch $imagemagick feh ffmpeg gvim python-pip
sudo pip install pywal

# Uses custom method for installing i3-gaps depending on distribution
i3-gaps-install

}

linux_lts () {

# Installs LTS kernel and enable it in GRUB
$pkginstall $lts
grub-mkconfig -o /boot/grub/grub.cfg

}

ssh_server () {

# Enables SSH daemon at startup and opens port 22 if you have firewall enabled
startup sshd &&
sudo ufw allow ssh

}

virtualbox () {

# Installs VirtualBox
$pkginstall $virtualbox

}

qutebrowser () {

# Installs Qutebrowser
$pkginstall $qutebrowser

# Copies Qutebrowser dotfiles
cp -r dotfiles/.config/qutebrowser ~/.config

}

backlight_module () {

# Implement the backlight module name of your hardware to your .bashrc+
echo "Please input your backlight module, the name should be one of options below"
ls /sys/class/backlight
echo "Example names: acpi_video0, intel_backlight, nv_backlight, etc"
read -p "Backlight module:" BACKLIGHT
echo "BACKLIGHT='$BACKLIGHT'" >> ~/.bashrc+

}

battery_module () {

# Implement the battery module name of your hardware to your .bashrc+
echo "Please input your battery module, the name should be one of the options below"
ls /sys/class/power_supply
echo "Example names: BAT0, BAT1, etc"
read -p "Battery module:" BATTERY
echo "BATTERY='$BATTERY'" >> ~/.bashrc+

}

wireless_module () {

# Implement the Wi-Fi module name of your hardware to your .bashrc+
echo "Your Wi-Fi will be enabled at startup now."
echo "Please input your Wi-Fi module again, the name should be one of the options below"
ip address | grep "<"
echo "Example names: wlan0, wps3s0, etc"
read -p "Wi-Fi module:" WIRELESS
echo "WIRELESS='$WIRELESS'" >> ~/.bashrc+

# Install iw and wpa_supplicant
$pkginstall iw wpa_supplicant

# Enable Wi-FI at startup
service wifi "wpa_supplicant -B -i $WIRELESS -c /etc/wpa_supplicant/wpa_supplicant.conf"

}
