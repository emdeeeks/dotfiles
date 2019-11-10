#!/bin/sh

# TODO: Make this more integrated into Awesome

Xephyr -ac -br -noreset -screen 1024x500 :1 &
sleep 1
DISPLAY=:1.0 ENV=xephyr awesome -c ~/dotfiles/home/.config/awesome/rc.lua --replace &
