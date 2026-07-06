#!/usr/bin/env bash
# Power menu: shutdown / reboot / lock, picked via rofi.

options="Lock\nReboot\nShutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme-str 'window {width: 300px;}')

case "$chosen" in
    Lock)     hyprlock ;;
    Reboot)   systemctl reboot ;;
    Shutdown) systemctl poweroff ;;
esac
