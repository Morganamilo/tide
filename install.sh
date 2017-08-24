#!/bin/bash
# This is the installation script, which installs all chosen modules
# It should only be run once in every machine, if you need to install any additional modules later then use addmodules.sh

# First let's grab the modules source from the script below
source scripts/main.sh

# The installation of the modules will now begin
# You can customize which modules are going to be installed or not by commenting/uncommenting them below
# For the sake of sane and minimalistic defaults, some modules are disabled by default, but you can enable them if you feel the necessity

# Modules

# Most basic module which installs only the bare essentials for a functional Linux server
# This is the most essential module so it shouldn´t be disabled
core

# Module that installs general CLI user applications
# Will turn your server into a capable personal desktop
cli

# Module that installs torrenting application
# Can be used for personal usage or for turning your server into a torrent seeder
torrent

# Module that installs music player applications
# Can be used for personal usage or for turning your server into a music server
music

# Module that installs youtube-dl
# Can be used for personal usage or for turning your server into a media-fetching server
youtube-dl

# For enabling ufw (uncomplicated firewall) in your system
firewall

# For enabling tlp (laptop powersaving mode) in your system
powersaving

# Module that installs GUI
# Will give your CLI desktop a few more capabilities such as viewing images, watching videos and installing GUI applications
gui

# Module that turns your server into a SSH server
# Make sure you secure your system properly as this can open vulnerabilities
# ssh_server

# Module that installs VirtualBox
# virtualbox

# Module that installs Qutebrowser with custom configuration for improved online privacy
# qutebrowser

# Those were all the modules, now let´s set up a few last things

# Creates .bashrc+
# This will be the file where you can customize your bash commands
# The other .bashrc will be used by tide and you will be able to upgrade it to a newer version without messing up your hardware modules or your personal rice
touch ~/.bashrc+

# Read the backlight module name of your hardware
echo "Please input your backlight module, the name should be one of options below:"
ls /sys/class/backlight
echo "Example names: acpi_video0, intel_backlight, nv_backlight, etc"
echo "(Blank if there is no monitor)"
read BACKLIGHT

# Read the battery module name of your hardware
echo "Please input your battery module, the name should be one of the options below:"
ls /sys/class/power_supply
echo "Example names: BAT0, BAT1, etc"
echo "(Blank if there is no battery)"
read BATTERY

# Read the Wi-Fi module name of your hardware
echo "Your Wi-Fi will be enabled at startup now."
echo "Please input your Wi-Fi module again, the name should be one of the options below:"
ip address | grep "<"
echo "Example names: wlan0, wps3s0, etc"
read WIRELESS

# Append the module names to your .bashrc+
echo "BACKLIGHT='$BACKLIGHT'" >> .bashrc+
echo "BATTERY='$BATTERY'" >> .bashrc+
echo "WIRELESS='$WIRELESS'" >> .bashrc+

# Enabled Wi-FI at startup
echo "sudo wpa_supplicant -B -D wext -i $WIRELESS -c /etc/wpa_supplicant/wpa_supplicant.conf" >> $rc_local

# Finally, move this repository to the proper folder
mv ~/tide ~/Repositories
