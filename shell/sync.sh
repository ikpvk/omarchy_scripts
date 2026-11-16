#!/usr/bin/env bash
# Copy ~/.config/omarchy/shell.json and the nausica.tray plugin here.
# Run after each shell change. birthYear is set to 1990 in the copy, so the
# real year stays out of this public repo.
# Updating README.md and committing are left to you.

set -euo pipefail
here="$(dirname "$(readlink -f "$0")")"
cfg="$HOME/.config/omarchy"

jq empty "$cfg/shell.json"
sed -E 's/("birthYear"[[:space:]]*:[[:space:]]*)[0-9]+/\11990/' "$cfg/shell.json" > "$here/shell.json"
mkdir -p "$here/plugins"
rm -rf "$here/plugins/nausica.tray"
cp -r "$cfg/plugins/nausica.tray" "$here/plugins/"
git -C "$here" --no-pager diff --stat -- .
