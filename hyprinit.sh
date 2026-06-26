#!/usr/bin/env bash
# Install the dependencies needed to run Hyprland with this repo's configs.
# Arch / Manjaro (pacman + yay). Safe to re-run.
#
#   curl https://raw.githubusercontent.com/paul-asvb/machine/main/hyprinit.sh | sh
#
set -euo pipefail

# yay is bootstrapped in init.sh; fall back to pacman if it is missing.
if command -v yay >/dev/null 2>&1; then
	AUR="yay -S --needed --noconfirm"
else
	AUR="sudo pacman -S --needed --noconfirm"
fi

# --- Hyprland core ----------------------------------------------------------
# hyprland        : the compositor itself
# hyprpaper       : wallpaper daemon (hypr/hyprpaper.conf)
# hypridle        : idle daemon, autostarted from hyprland.lua
# hyprlock        : screen locker invoked by hypridle
# xdg-desktop-portal-hyprland : screensharing / file pickers
# hyprpolkitagent : polkit authentication agent
sudo pacman -Syu --needed --noconfirm \
	hyprland hyprpaper hypridle hyprlock \
	xdg-desktop-portal-hyprland hyprpolkitagent \
	qt5-wayland qt6-wayland

# --- Bar, launcher, terminal, file manager ----------------------------------
sudo pacman -S --needed --noconfirm \
	waybar alacritty dolphin

# hyprlauncher (menu = "hyprlauncher" in hyprland.lua) lives in the AUR.
$AUR hyprlauncher

# --- Audio (wpctl / pulseaudio module) --------------------------------------
sudo pacman -S --needed --noconfirm \
	pipewire pipewire-pulse pipewire-alsa wireplumber pavucontrol

# --- Screenshots & clipboard ------------------------------------------------
# grim + slurp + swappy : the screenshot binds in hyprland.lua
# wl-clipboard          : wl-copy / wl-paste
# cliphist              : clipboard history watcher (autostart)
sudo pacman -S --needed --noconfirm \
	grim slurp swappy wl-clipboard cliphist

# --- Hardware / media keys --------------------------------------------------
# brightnessctl : XF86MonBrightness binds
# playerctl     : XF86Audio{Next,Prev,Play,Pause} binds
# network-manager-applet : nm-applet --indicator (autostart) + nmtui on bar
sudo pacman -S --needed --noconfirm \
	brightnessctl playerctl networkmanager network-manager-applet

# --- Fonts (waybar uses Nerd Font + Font Awesome glyphs) --------------------
sudo pacman -S --needed --noconfirm \
	ttf-nerd-fonts-symbols ttf-font-awesome otf-font-awesome \
	noto-fonts noto-fonts-emoji

echo "Hyprland dependencies installed."
echo "Next: deploy the configs with ./deploy-configs.sh (or the curl commands in README.md)."
