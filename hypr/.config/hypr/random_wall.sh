#!/bin/bash

WALL_DIR="$HOME/dotfiles/Wall-paper"
CONF="$HOME/.config/hypr/hyprlock.conf"
CON="$HOME/.config/hypr/hyprland.conf"

# Pick a random wallpaper
RANDOM_WALL=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)

# ---- Hyprlock (works for you already) ----
sed -i "/background {/,/}/s|path = .*|path = $RANDOM_WALL|" "$CONF"

# ---- Hyprland (hyprpaper config) ----
# Update preloaded wallpaper
sed -i "s|^preload = .*|preload = $RANDOM_WALL|" "$CON"

# Update wallpaper = monitor,path
sed -i "s|^wallpaper = .*|wallpaper = monitor,$RANDOM_WALL|" "$CON"

# Reload wallpaper without restarting Hyprland
hyprctl hyprpaper reload 2>/dev/null
