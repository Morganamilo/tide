# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source ~/.bashrc+

export EDITOR='vim'
export NNN_TMPFILE='/tmp/nnn'

ide ()
{
	tmux new-session -s ide -d &&
	tmux send-keys -t ide 'cd ~/Repositories' C-j &&
	tmux send-keys -t ide 'ranger' C-j &&
	tmux split-window -h -p 77 &&
	tmux send-keys -t ide 'cd ~/Repositories' C-j &&
	tmux send-keys -t ide 'clear' C-j &&
	tmux split-window -v -p 33 &&
	tmux send-keys -t ide 'cd ~/Repositories' C-j &&
	tmux send-keys -t ide 'clear' C-j
	tmux attach -t ide
}

bright ()
{
	echo "Minimum:"
	cat /sys/class/backlight/$BACKLIGHT/bl_power
	echo "Actual:"
	cat /sys/class/backlight/$BACKLIGHT/actual_brightness
	echo "Maximum:"
       	cat /sys/class/backlight/$BACKLIGHT/max_brightness
	echo "Use 'setbright NUMBER' to change brightness"
}

setbright ()
{
	echo "$1" | sudo tee /sys/class/backlight/$BACKLIGHT/brightness >/dev/null
}

mntusb ()
{
	mount ~/USB &&
	ranger ~/USB &&
	echo "Don´t forget to unmount with umntusb once you´re done"
}

umntusb ()
{
	umount ~/USB &&
	echo "Unmounted successfully"
}

flashusb ()
{
	umount ~/USB &>/dev/null
	lsblk
	echo "Warning: This will delete all files in the drive!"
	read -p "Enter the drive name (/dev/sdX):" DRIVE
	ls
	read -p "Enter the ISO name:" ISO
	sudo dd bs=4M if=$ISO of=$DRIVE status=progress &&
	sync &&
	echo "ISO flashed succesfully!"
}

formatusb ()
{
	umount ~/USB &>/dev/null
	lsblk
	echo "Warning: This will delete all files in the drive!"
	read -p "Enter the drive partition name (/dev/sdX1):" DRIVE
	read -p "Enter the new name for the device:" NAME
	sudo mkfs.vfat -n '$NAME' -I $DRIVE &&
	sync &&
	echo "Drive formatted succesfully!"
}

screencast ()
{
	ffmpeg -f x11grab -s $(xdpyinfo | grep dimensions | awk '{print $2}') -i :0.0 Videos/Screencast/$(date +"%Y-%m-%d-%H-%M-%S").mp4
}

n()
{
        nnn "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm $NNN_TMPFILE
        fi
}

lock ()
{
	cmatrix
	vlock
}

wifi_add ()
{
	read -p "Enter the SSID:" SSID
	read -p "Enter the passphrase:" PASS
	echo "Adding Wi-Fi network..."
	sudo wpa_passphrase "$SSID" "$PASS" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf >/dev/null &&
	echo "Added Wi-Fi network succesfully!"
}

alias wifi_status='iw $WIRELESS link'
alias wifi_list='sudo iw dev $WIRELESS scan | grep -i ssid'
alias wifi_added='cat /etc/wpa_supplicant/wpa_supplicant.conf'
alias wifi_connect='sudo wpa_supplicant -B -i $WIRELESS -c /etc/wpa_supplicant/wpa_supplicant.conf'
alias mpc='mpd; ncmpcpp'
alias mpk='mpd --kill'
alias lsusb='lsblk'
alias bat='cat /sys/class/power_supply/$BATTERY/capacity /sys/class/power_supply/$BATTERY/status'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias gpg='gpg2'
alias gts='git status'
alias cdc='cd ~/Code'
alias cds='cd ~/Scripts'
alias cdp='cd ~/Programs'
alias cdt='cd ~/Templates'
alias cdr='cd ~/Repositories'
