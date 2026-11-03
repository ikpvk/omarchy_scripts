#!/usr/bin/env bash
# Deletes the stock Omarchy themes Kris chose to remove (list updated 2026-11-03).
# `omarchy update` reinstalls them, so run this again after each update,
# but only after Kris approves. The list is also in "resources/Omarchy themes.md" in the second_brain vault.
#
#   remove-omarchy-themes.sh          delete the themes (asks for a password)
#   remove-omarchy-themes.sh --check  list the ones that are back, delete nothing

set -euo pipefail

THEMES_DIR="${OMARCHY_PATH:-/usr/share/omarchy}/themes"
REMOVED=(
  catppuccin-latte
  ethereal
  everforest
  flexoki-light
  hackerman
  kanagawa
  last-horizon
  lupine
  matte-black
  miasma
  nord
  osaka-jade
  retro-82
  ristretto
  rose-pine
  tokyo-night
  vantablack
  white
)

present=()
for slug in "${REMOVED[@]}"; do
  [[ -d "$THEMES_DIR/$slug" ]] && present+=("$slug")
done

if [[ "${1:-}" == "--check" ]]; then
  printf '%s\n' "${present[@]}"
  exit 0
fi

if (( ${#present[@]} == 0 )); then
  echo "None of the removed themes are installed. Nothing to do."
  exit 0
fi

# Don't pull the current theme out from under the desktop.
current=$(omarchy theme current 2>/dev/null | tr '[:upper:] ' '[:lower:]-' || true)
for slug in "${present[@]}"; do
  if [[ "$slug" == "$current" ]]; then
    echo "Refusing: $slug is the current theme. Switch themes first." >&2
    exit 1
  fi
done

paths=()
for slug in "${present[@]}"; do paths+=("$THEMES_DIR/$slug"); done

if [[ $EUID -eq 0 ]]; then
  rm -rf -- "${paths[@]}"
elif [[ -t 0 ]]; then
  sudo rm -rf -- "${paths[@]}"
else
  pkexec rm -rf -- "${paths[@]}"
fi

echo "Removed: ${present[*]}"
