#!/usr/bin/env bash
# Claude Code SessionStart hook for the second_brain vault: if an omarchy
# update has reinstalled stock themes Kris removed, tell Claude to ask Kris
# before running the removal script.

dir="$(dirname "$(readlink -f "$0")")"
script="$dir/remove-omarchy-themes.sh"
back=$("$script" --check 2>/dev/null | paste -sd, - | sed 's/,/, /g')
[ -n "$back" ] || exit 0

jq -n --arg back "$back" --arg script "$script" '{
  hookSpecificOutput: {
    hookEventName: "SessionStart",
    additionalContext: ("Omarchy themes are back after an update: " + $back + ". Ask Kris whether to run " + $script + " to delete them again. Run it only after Kris approves. See resources/Omarchy themes.md.")
  }
}'
