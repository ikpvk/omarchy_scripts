# Keybindings

A copy of Kris's custom Hyprland keybindings, from `~/.config/hypr/bindings.lua`. Omarchy loads this file after its own defaults, so it only holds Kris's changes. To see every binding, including Omarchy's defaults, run `omarchy menu keybindings --print`.

This is a copy, not a symlink. When the bindings change in `~/.config/hypr/bindings.lua`, copy the file here again and commit it.

## Bindings

### Apps

| Keys | Action | Notes |
|---|---|---|
| SUPER + B | Brave | Replaces Omarchy's default browser |
| SUPER + SHIFT + B | Brave, private window | |
| SUPER + SHIFT + C | Chromium | Used to open Calendar |
| SUPER + U | qBittorrent | AppImage in `~/Downloads/qbit/` |
| SUPER + P | Open Video Downloader | AppImage in `~/Downloads/softwares/open_video_downloader/`. Replaces Omarchy's default |
| SUPER + SHIFT + F | File manager (flea) | The block is written by `flea --default` |
| SUPER + ALT + SHIFT + F | File manager (flea) in the terminal's current folder | Also written by `flea --default` |
| SUPER + ALT + O | Second brain: a terminal in the vault with Claude Code running | |
| SUPER + A | Shell aliases menu | Runs `omarchy-menu-aliases` |

### Workspaces

| Keys | Action | Notes |
|---|---|---|
| SUPER + CTRL + LEFT | Previous workspace | Stops at workspace 1 |
| SUPER + CTRL + RIGHT | Next workspace | Stops at workspace 5 |

Kris uses only 5 workspaces, so these Omarchy defaults are unbound: SUPER (+ SHIFT, + SHIFT + ALT) + 6 to 0, SUPER + TAB, SUPER + SHIFT + TAB and SUPER + mouse wheel.

### Volume and brightness

| Keys | Action | Notes |
|---|---|---|
| SUPER + M | Mute or unmute | |
| SUPER + comma (`<`) | Volume down | Used to dismiss the last notification |
| SUPER + period (`>`) | Volume up | |
| SUPER + ALT + comma (`<`) | Brightness down by 5% | Used to dismiss the last notification, which now has no key |
| SUPER + ALT + period (`>`) | Brightness up by 5% | |

All five also work on the lock screen. Holding a volume or brightness key repeats it.

### Display and panels

| Keys | Action | Notes |
|---|---|---|
| SUPER + CTRL + Delete | Turn the laptop display on or off | Uses `~/.local/bin/omarchy-internal-display-backlight`, from the omarchy_quattro_dotfiles repo |
| SUPER + CTRL + M | Monitor layouts (hyprmoncfg) | |
| SUPER + CTRL + D | Monitor layouts (hyprmoncfg) | Used to open Omarchy's Display panel |
| SUPER + CTRL + W | Network panel | Used to open the Background switcher, which is still on SUPER + CTRL + SPACE |
| SUPER + CTRL + N | Turn the nightlight on or off | Used to open the Network panel |
| SUPER + ALT + D | Oma-do-wa, the Docker Compose panel | Needs the `oma_do_wa` shell plugin |

## Needs

- Brave and Chromium.
- The qBittorrent and Open Video Downloader AppImages, at the paths above.
- `flea`, the `crmne.hyprmoncfg` and `oma_do_wa` shell plugins, and `omarchy-menu-aliases`.
- `omarchy-internal-display-backlight`, from https://github.com/ikpvk/omarchy_quattro_dotfiles.

## Restore

```bash
cp ~/.config/hypr/bindings.lua ~/.config/hypr/bindings.lua.bak.$(date +%s)
cp keybindings/bindings.lua ~/.config/hypr/bindings.lua
hyprctl reload
hyprctl configerrors
```

`hyprctl configerrors` prints nothing when the config is fine.
