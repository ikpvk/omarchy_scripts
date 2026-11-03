# Theme cleanup

Deletes the stock Omarchy themes Kris doesn't want. `omarchy update` reinstalls them, so this runs again after each update, only once Kris approves.

- `remove-omarchy-themes.sh` deletes the themes listed in `REMOVED` from `/usr/share/omarchy/themes`. It asks for a password. With `--check`, it only lists the ones that are back.
- `omarchy-themes-check.sh` is a Claude Code SessionStart hook, set up in the second_brain vault's `.claude/settings.json`. When removed themes are back, it tells Claude to ask Kris before running the script.

To change which themes are removed, edit `REMOVED` in `remove-omarchy-themes.sh` and the list in the vault note `resources/Omarchy themes.md`.
