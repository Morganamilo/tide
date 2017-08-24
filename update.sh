#!/bin/bash
#This script will pull new changes from the dotfiles repo to the system

# Updates the repository
git pull

# Updates documents
cp 'Cheatsheet' 'Packages' ~/Documents

# Updates dotfiles
cd dotfiles
cp .bashrc .rtorrent.rc .tmux.conf .vimrc ~/
cp .i3status.conf .Xresources ~/
cp -r .config ~/
cp -r .elinks ~/
cp -r .gnupg ~/
cp -r .ncmpcpp ~/
cd ..
