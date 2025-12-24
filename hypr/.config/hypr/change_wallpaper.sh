#!/bin/bash

WALLPAPER_DIR="$HOME/dotfiles/Wall-paper"
MONITOR="eDP-1"

# Ensure hyprpaper is running
pgrep -x hyprpaper >/dev/null || hyprpaper &
sleep 0.3

WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)
[ -z "$WALLPAPER" ] && exit 1

hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"
