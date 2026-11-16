#!/usr/bin/env bash
# Check ~/.config/hypr/bindings.lua and copy it here.
# Run after each keybinding change. It reloads Hyprland, stops if the config
# has errors, copies the file into this folder and shows what changed.
# Updating README.md and committing are left to you.

set -euo pipefail
here="$(dirname "$(readlink -f "$0")")"
src="$HOME/.config/hypr/bindings.lua"

hyprctl reload >/dev/null
sleep 1
errors=$(hyprctl configerrors)
if [ -n "$(echo "$errors" | tr -d '[:space:]')" ]; then
  echo "Hyprland config errors, nothing copied:" >&2
  echo "$errors" >&2
  exit 1
fi
echo "Hyprland reloaded with no config errors."

cp "$src" "$here/bindings.lua"
git -C "$here" --no-pager diff --stat -- bindings.lua
