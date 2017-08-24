# tide
Terminal IDE: A modular pre-configured Linux install for minimalists.

Currently supports Void and Arch.

## Installation

1. Do a clean installation of your distro
2. Update your system
3. Install git and clone this repository
4. Edit install.sh to choose which modules you want
5. Run install.sh
6. If you are including the CLI module, change ~/.mutt/muttrc to use your desired email address and email server
7. If you are including the GUI module, change one of the last lines in ~/.xinitrc to fit your keyboard layout.

Enjoy! You can use update.sh (which will work for both distros) if you want to keep up with the new changes in this repository.

If you wish to add any additional modules use addmodules.sh. Do not use install.sh twice on the same machine, as it might break your system!

If you are using the GUI module, the colorscheming is done automatically based on your current wallpaper. To use wallpapers, simply put as many wallpapers as you want in the ".wallpapers" folder and one of them will be randomly selected upon starting the X server. Make sure to put atleast 2 wallpapers in that folder so wal won´t show any errors.

## Usage

All installed packages are listed in "Packages" (dependencies are not listed). You can learn how to use the tools with the Cheatsheet provided. 

There are also a few handy bash commands which you can use for easily setting up an IDE, mounting USB devices, showing battery, system brightness, screenlocking, etc.
