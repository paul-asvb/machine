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

copy_file ".zshrc"          "$CONFIG/zsh/.zshrc"
copy_file "alacritty.toml"  "$CONFIG/alacritty/alacritty.toml"
copy_file "sway.conf"       "$CONFIG/sway/config.d/local.conf"
copy_file "syncthing.sh"    "$HOME/syncthing.sh"
copy_dir  hypr
copy_dir  waybar

echo "done"
