# Shell

A copy of Kris's Omarchy shell settings, from `~/.config/omarchy/shell.json`. It sets the bar's position, background and the widgets in each section, plus the idle and lock timers. Omarchy's defaults are in `/usr/share/omarchy/config/omarchy/shell.json`.

This is a copy, not a symlink. When the settings change in `~/.config/omarchy/shell.json`, copy the file here again and commit it.

## Differences from the live file

- `birthYear` in the clock widget is set to `1990` here so the real year stays out of this public repo. Expect that line to differ when comparing the two files.

## After an `omarchy update`

Updates sometimes edit `shell.json` to add, move or rename widgets. To see what an update changed:

```bash
diff ~/.config/omarchy/shell.json ~/Downloads/work/omarchy_scripts/shell/shell.json
```

Only the `birthYear` line should differ. Anything else came from the update, or from a change that wasn't copied here yet.
