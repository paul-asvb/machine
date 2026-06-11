
# Hyprland setup — mirrors the sway behaviour (see sway.conf)
# Tiling is provided by the hy3 plugin: https://github.com/outfoxxed/hy3

# Hyprland + the wayland utilities that map onto the sway config
sudo pacman -Syu --noconfirm hyprland hypridle hyprlock hyprpaper
sudo pacman -Syu --noconfirm brightnessctl alacritty wofi waybar
# build deps required by hyprpm to compile hy3 against the running Hyprland
sudo pacman -Syu --noconfirm base-devel cmake cpio meson git

# hy3 tiling layout plugin via hyprland's plugin manager.
# Run from inside a Hyprland session (hyprpm needs the running instance).
hyprpm update
hyprpm add https://github.com/outfoxxed/hy3
hyprpm enable hy3
hyprpm reload
