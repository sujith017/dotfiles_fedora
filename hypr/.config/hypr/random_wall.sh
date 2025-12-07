#!/bin/bash

WALL_DIR="/home/sujith/dotfiles/Wall-paper"
CONF="$HOME/.config/hypr/hyprlock.conf"

# pick random wallpaper
RANDOM_WALL=$(ls "$WALL_DIR"/*.{jpg,png,jpeg,webp} 2>/dev/null | shuf -n 1)

# replace the path= line
sed -i "s|path = .*|path = $RANDOM_WALL|g" "$CONF"
