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
| `right` | Tray (the `nausica.tray` copy, see below) |
| `tray` (the Tray's drawer, opens on hover) | 7 Indicators copies, Elsewhen, Weather, Keyboard layout, Oma-do-wa, hyprmoncfg, Tailscale, Agents, Bluetooth, Network, Audio, Power |

The Omarchy Menu widget is removed. SUPER + ALT + SPACE still opens the menu.

### Tray

The bar uses `nausica.tray`, a copy of the built-in `omarchy.tray` widget, so the drawer opens and closes instantly, and its contents fade in over 0.15 seconds when it opens. The built-in widget slides it open over 0.6 seconds and has no setting for that. The copy lives in `~/.config/omarchy/plugins/nausica.tray/`, with a copy in `plugins/nausica.tray/` here. The changes are in `Tray.qml`, marked with a "Kris:" comment: `animationDuration: 0` and a `fadeProgress` property that fades the drawer contents in over `fadeDuration` (150 ms). Closing has no fade.

Close styles tried on 2026-11-10 and dropped: fading the contents and the chevron out before closing, with the chevron either fading back in at the closed place, crossfading with a second chevron there, or reappearing at once. Kris preferred closing instantly.

The Tray needs no Omarchy services, and the shell lets a copy of it hold the drawer, so the widgets in the drawer keep working. The copy doesn't get Omarchy's updates to the Tray. To go back to the built-in widget, set the `right` section's id back to `omarchy.tray` in `shell.json`.

It was made by hand, not with `omarchy plugin clone`. On 2026-11-10 that command failed with "omarchy-shell is not responding" after it had switched `shell.json` to the copy and deleted the copy's folder, which left the bar without a Tray until `shell.json` was restored. The command also sends a desktop notification.

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
