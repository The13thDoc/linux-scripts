#!/bin/bash

# https://unix.stackexchange.com/questions/30637/mount-error-is-not-a-block-device

#===
# Param 1: Directory to link
#===
function bind-mount {
	echo Mounting: /media/ram/HDD-Internal/$1
	echo To: /home/ram/$1
	sudo mount --bind /media/ram/HDD-Internal/$1 /home/ram/$1
}

bind-mount 'Desktop'
bind-mount 'Documents'
bind-mount 'Music'
bind-mount 'Pictures'
bind-mount 'Music'
bind-mount 'Downloads'
