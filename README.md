# tide
Terminal IDE: A minimal pre-configured Void/Arch install with optional GUI.

## Installation

1. Do a clean Void/Arch installation
2. Update your system
3. Install git
4. Clone this repository
5. Do a chmod +x for the install and update scripts
6. Run the install script of your distro
7. Edit ~/.bashsys to correctly fit your system modules
8. Change ~/.mutt/muttrc to use your desired email address and email server

Enjoy! You can use the update script (which will work for both distros) if you want to keep up with the new changes in this repository.

If you wish you can also use the upgrade2gui script of your distro to get a GUI mode with better support for images, videos and web browsing. After that make sure to do the proper changes in the very end of the .xinitrc file to fit your needs.

## Usage

All installed packages are listed in "Void Packages" or "Arch Packages" (dependencies are not listed). You can learn how to use the tools with the Cheatsheet provided. 

There are also a few handy bash commands which you can use for easily setting up an IDE, mounting USB devices, showing battery, system brightness, screenlocking, etc.

Please note that for some of the functionality to work you need the proper names of your system modules, just follow the instructions in the .bashsys file for how to get them.
