# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=vim

ide ()
{
	tmux new-session -s ide -d
	tmux send-keys -t ide 'cd ~/Repositories' C-j
	tmux send-keys -t ide 'ranger' C-j
	tmux split-window -h -p 77
	tmux send-keys -t ide 'cd ~/Repositories' C-j
	tmux send-keys -t ide 'clear' C-j
	tmux split-window -v -p 33
	tmux send-keys -t ide 'cd ~/Repositories' C-j
	tmux send-keys -t ide 'clear' C-j
	tmux attach -t ide
}

bright ()
{
	echo "Minimum:"
	cat /sys/class/backlight/acpi_video0/bl_power
	echo "Actual:"
	cat /sys/class/backlight/acpi_video0/actual_brightness
	echo "Maximum:"
       	cat /sys/class/backlight/acpi_video0/max_brightness
	echo "Use vibright to change brightness"
}

mntusb ()
{
	sudo mount /dev/sdb1 ~/USB &&
	sudo ranger ~/USB &&
	echo "Don´t forget to unmount with umntusb once you´re done"
}

umntusb ()
{
	sudo umount ~/USB &&
	echo "Unmounted successfully"
}

lock ()
{
	cmatrix
	vlock
}

export NNN_TMPFILE="/tmp/nnn"

n()
{
        nnn "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm $NNN_TMPFILE
        fi
}

wifi_add ()
{
	echo 'Enter the SSID:'
	read $SSID
	echo 'Enter the passphrase:'
	read $PASS
	echo 'Adding Wi-Fi network...'
	sudo wpa_passphrase $SSID $PASS | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf &&
	echo 'Added Wi-Fi network succesfully!'
}

alias wifi_status='sudo iw wlp3s0 link'
alias wifi_list='sudo iw dev wlp3s0 scan | grep -i ssid'
alias wifi_added='sudo cat /etc/wpa_supplicant/wpa_supplicant.conf'
alias wifi_connect='sudo wpa_supplicant -B -D wext -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf'
alias back='tmux attach -t ide'
alias battery='cat /sys/class/power_supply/BAT1/capacity /sys/class/power_supply/BAT1/status'
alias vibright='sudo vim /sys/class/backlight/acpi_video0/brightness'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias gpg='gpg2'
alias gts='git status'
alias cdc='cd ~/Code'
alias cds='cd ~/Scripts'
alias cdp='cd ~/Programs'
alias cdt='cd ~/Templates'
alias cdr='cd ~/Repositories'
