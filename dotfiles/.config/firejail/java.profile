################################################
########## Firejail profile for java ###########
#                                              #
# By default your whole filesystem is          #
# blacklisted so java applications will only   #
# have access to the whitelisted folders below #
#                                              #
# Whitelists your game folder                  #
# Change it to whatever directory you use for  #
# storing your games                           #
whitelist ${HOME}/Programs/Games
#                                              #
# Disables internet conectivity                #
# Comment if you need to play online games     #
net none
#                                              #
################################################

# Persistent local customizations
include /etc/firejail/java.local

# Persistent global definitions
include /etc/firejail/globals.local

# Whitelists essential directories
whitelist ${HOME}/.local/share/Steam
whitelist ${HOME}/.local/share/steam
whitelist ${HOME}/.Steam
whitelist ${HOME}/.steam
whitelist ${HOME}/.minecraft

## Security measures ##

# Restricts program privileges
noroot
nogroups
nonewprivs
caps.drop all

# Enables network filtering
netfilter

# Disables access to DVD/DVB/CD devices
nodvd
notv
