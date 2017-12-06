#!/bin/bash
# This is the installation script, which installs all chosen modules
# It should only be run once in every machine, if you need to install any additional modules later then use addmodules.sh
# Warning: Do not run this script as root user

# First, let´s grab the modules source from the script below
source scripts/main.sh

# And also create .bashrc+
# This will be the file where you can customize your bash commands
# The other .bashrc will be used by tide and you will be able to upgrade it to a newer version without messing up your hardware modules or your personal rice
touch ~/.bashrc+

# The installation of the modules will now begin
# You can customize which modules are going to be installed or not by commenting/uncommenting them below
# For the sake of sane and minimalistic defaults, most modules are disabled by default, but you can enable them as needed
# Also, be aware that all modules after the gui module require gui in order to work properly

## Software Modules

# Most basic module which installs only the bare essentials for a functional Linux server
# This is the most essential module so it shouldn´t be disabled
core

# Module that installs general CLI user applications
# Will turn your server into a capable personal desktop
# cli

# Module that installs torrenting application
# Can be used for personal usage or for turning your server into a torrent seeder
# torrent

# Module that installs music player applications
# Can be used for personal usage or for turning your server into a music server
# music

# Module that installs youtube-dl
# Can be used for personal usage or for turning your server into a media-fetching server
# youtube-dl

# For enabling ufw (uncomplicated firewall) in your system
# firewall

# For enabling tlp (laptop powersaving mode) in your system
# powersaving

# Module that turns your server into a SSH server
# Make sure you secure your system properly as this can open vulnerabilities
# ssh_server

# Module that installs LTS kernel and enable it
# Can be used to make your system more stable and reliable
# linux_lts

# Module that installs GUI
# Will give your CLI desktop a few more capabilities such as viewing images, watching videos and installing GUI applications
# gui

# Module that installs Firejail with custom Wine and Java profiles for improved privacy and security
# Make sure you enable it if you are planning to use Wine or Java
# Also make sure to customize the profiles in ~/.config/firejail to fit your needs
# firejail

# Module that installs office programs
# office

# Module that installs VirtualBox
# virtualbox

# Module that installs Qutebrowser with custom configuration for improved online privacy
# qutebrowser

## Hardware Modules

# Make backlight commands functional
# Comment if there is no monitor
# backlight_module

# Make battery commands functional
# Comment if there is no battery
# battery_module

# Make Wi-FI commands functional
# Comment if there is no wireless card
# wireless_module

# Call custom commands from your custom script (optional)
source custom.sh

# Finally, move this repository to the proper folder
cd ..
mv tide ~/Repositories
