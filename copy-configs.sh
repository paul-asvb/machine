#!/usr/bin/env bash
# Copy the live system Hyprland and Waybar config directories into this repo.
# Run from anywhere; the dirs land next to this script as hypr/ and waybar/.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"

copy_dir() {
	local name="$1"
	local src="$CONFIG/$name"
	local dst="$REPO_DIR/$name"
	if [ ! -d "$src" ]; then
		echo "skip (not found): $src" >&2
		return
	fi
	rm -rf "$dst"
	# Mirror the directory, dropping editor backups.
	rsync -a --exclude='*.bak' "$src/" "$dst/"
	echo "copied $src/ -> $name/"
}

copy_dir hypr
copy_dir waybar

echo "done"
