#!/usr/bin/bash

# Simple script to handle a DIY shutdown menu. When run you should see a bunch of options (shutdown, reboot etc.)
#
# Requirements:
# - rofi
# - systemd, but you can replace the commands for OpenRC or anything else
#
# Instructions:
# - Save this file as power.sh or anything
# - Give it exec priviledge, or chmod +x /path/to/power.sh
# - Run it
#
# Source:
# https://gist.github.com/adnan360/f86012baeb4c9ca4f1af033550b03033
#

chosen=$(echo -e "\
 Cancel\n\
 Display Off\n\
 Lock\n\
 Logout\n\
 Shutdown\n\
 Reboot\n\
 Suspend\n\
 Hibernate" | rofi -dmenu -i -config ~/.config/rofi/power_menu_config)
# Info about some states are available here:
# https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html#Description

if [[ $chosen = " Display Off" ]]; then
	sleep 1; xset dpms force off; giba-lock &; disown
elif [[ $chosen = " Lock" ]]; then
	giba-lock &; disown
elif [[ $chosen = " Logout" ]]; then
	i3exit logout
elif [[ $chosen = " Shutdown" ]]; then
	i3exit shutdown
elif [[ $chosen = " Reboot" ]]; then
	i3exit reboot
elif [[ $chosen = " Suspend" ]]; then
	i3exit suspend
elif [[ $chosen = " Hibernate" ]]; then
	i3exit hibernate
fi
