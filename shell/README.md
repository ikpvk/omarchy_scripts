# Shell

A copy of Kris's Omarchy shell settings, from `~/.config/omarchy/shell.json`. It sets the bar's position, background and the widgets in each section, plus the idle and lock timers. Omarchy's defaults are in `/usr/share/omarchy/config/omarchy/shell.json`.

This is a copy, not a symlink. When the settings change in `~/.config/omarchy/shell.json`, copy the file here again and commit it.

## Current bar layout

| Section | Items |
|---|---|
| `left` | Workspaces |
| `centerBegin` | Empty |
| `center` | Clock |
| `centerEnd` | System update |
| `right` | Tray |
| `tray` (the Tray's drawer, opens on hover) | 7 Indicators copies, Elsewhen, Weather, Keyboard layout, Oma-do-wa, hyprmoncfg, Tailscale, Agents, Bluetooth, Network, Audio, Power |

The Omarchy Menu widget is removed. SUPER + ALT + SPACE still opens the menu.

### Indicators

The built-in `omarchy.indicators` widget appears seven times, each limited to one indicator with `items` and set to `alwaysShow: true`. In order: Passwordless sudo, Screen recording, Remote session, Reminder, Night light, Do Not Disturb, Stay awake.

With a single widget, active icons move to one end and inactive ones to the other. One copy per indicator keeps every icon in a fixed slot. `alwaysShow` keeps inactive icons visible, dimmed. Remote session still shows only while someone is connected.

The shell logs "Handler was registered but will not be used" once per extra copy. It's harmless: `omarchy-shell omarchy.indicators refresh` reaches every copy.

## What doesn't work

- **Hiding active indicators until hover.** The built-in widget has no setting for it, so it needs a cloned widget (`omarchy plugin clone`).
- **Cloned widgets that need Omarchy services.** The shell only gives the notification, night light, idle, media and remote-session services to built-in widgets. In a clone, Do Not Disturb, Night light and Stay awake can't be clicked. See `firstPartyServices` in `/usr/share/omarchy/shell/shell.qml`.
- **Cloning the whole bar to get around that.** Replacement bars give every widget a service-less shell. See `pluginBarApiFor` in `/usr/share/omarchy/shell/plugins/bar/Bar.qml`.
- **Hiding other widgets until the bar is hovered, or changing their colour on hover.** No widget has such a setting. The Tray drawer is the built-in way to keep widgets out of sight until hover.

## Differences from the live file

- `birthYear` in the clock widget is set to `1990` here so the real year stays out of this public repo. Expect that line to differ when comparing the two files.

## After an `omarchy update`

Updates sometimes edit `shell.json` to add, move or rename widgets. To see what an update changed:

```bash
diff ~/.config/omarchy/shell.json ~/Downloads/work/omarchy_scripts/shell/shell.json
```

Only the `birthYear` line should differ. Anything else came from the update, or from a change that wasn't copied here yet.
