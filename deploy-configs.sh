#!/usr/bin/env bash
# Copy configs from this repo to the live system.
# Run from anywhere; the inverse of copy-configs.sh.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"

copy_file() {
  local src="$REPO_DIR/$1"
  local dst="$2"
  if [ ! -f "$src" ]; then
    echo "skip (not found): $src" >&2
    return
  fi
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
  echo "copied $1 -> $dst"
}

copy_dir() {
  local name="$1"
  local src="$REPO_DIR/$name"
  local dst="$CONFIG/$name"
  if [ ! -d "$src" ]; then
    echo "skip (not found): $src" >&2
    return
  fi
  mkdir -p "$dst"
  rsync -a --exclude='*.bak' "$src/" "$dst/"
  echo "copied $name/ -> $dst/"
}

copy_file ".zshrc" "$CONFIG/zsh/.zshrc"
copy_file "alacritty.toml" "$CONFIG/alacritty/alacritty.toml"
copy_dir hypr
copy_dir waybar

# hyprpaper only reads its config at its own startup, and hyprland.lua only
# (re)launches it on the compositor's "hyprland.start" event, so a config
# reload alone won't pick up wallpaper changes. Restart it here instead.
if command -v hyprctl >/dev/null 2>&1 && hyprctl monitors >/dev/null 2>&1; then
  pkill -x hyprpaper 2>/dev/null || true
  hyprctl dispatch exec hyprpaper
  echo "restarted hyprpaper"
fi

echo "done"
