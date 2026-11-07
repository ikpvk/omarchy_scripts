-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

--o.bind("SUPER + B", "Browser", { omarchy = "browser" })
o.bind("SUPER + B", "Browser", "brave")
hl.unbind("SUPER + SHIFT + B")
o.bind("SUPER + SHIFT + B", "Browser (private)", "brave --incognito")
-- SUPER + SHIFT + C was previously bound to: Calendar
hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Chromium", { launch = "chromium" })
o.bind("SUPER + U", "qbit", "/home/nausica/Downloads/qbit/qbittorrent-5.2.3_x86_64.AppImage")
hl.unbind("SUPER + P")
o.bind("SUPER + P", "ovd", "/home/nausica/Downloads/softwares/open_video_downloader/Open.Video.Downloader_3.2.1_amd64.AppImage")
hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager", "nautilus --new-window /home/nausica/Downloads")

local MAX_WORKSPACE = 5
local function go_workspace(delta)
  local ws = hl.get_active_workspace()
  if not ws then return end
  local cur = ws.id
  local target = math.max(1, math.min(MAX_WORKSPACE, cur + delta))
  if target ~= cur then
    hl.dispatch(hl.dsp.focus({ workspace = tostring(target) }))
  end
end

hl.unbind("SUPER + CTRL + LEFT")
hl.unbind("SUPER + CTRL + RIGHT")
o.bind("SUPER + CTRL + LEFT",  "Previous workspace", function() go_workspace(-1) end)
o.bind("SUPER + CTRL + RIGHT", "Next workspace",     function() go_workspace(1) end)

hl.unbind("SUPER + TAB")
hl.unbind("SUPER + SHIFT + TAB")
hl.unbind("SUPER + mouse_down")
hl.unbind("SUPER + mouse_up")

for i = 6, 10 do
  hl.unbind("SUPER + " .. "code:" .. tostring(i + 9))
end

for i = 6, 10 do
  hl.unbind("SUPER + SHIFT + " .. "code:" .. tostring(i + 9))
  hl.unbind("SUPER + SHIFT + ALT + " .. "code:" .. tostring(i + 9))
end

-- Custom audio controls
-- SUPER + comma was previously bound to: Dismiss last notification
hl.unbind("SUPER + comma")
o.bind("SUPER + M", "Mute", "omarchy-audio-output-volume mute-toggle", { locked = true })
o.bind("SUPER + comma", "Volume down", "omarchy-audio-output-volume lower", { locked = true, repeating = true })
o.bind("SUPER + PERIOD", "Volume up", "omarchy-audio-output-volume raise", { locked = true, repeating = true })


-- SUPER + CTRL + Delete was previously bound to: Toggle laptop display
hl.unbind("SUPER + CTRL + Delete")
o.bind("SUPER + CTRL + Delete", "Toggle laptop display", "/home/nausica/.local/bin/omarchy-internal-display-backlight toggle")

-- Shell aliases menu
o.bind("SUPER + A", "Shell aliases", "omarchy-menu-aliases")

-- flea --default: begin. Written by `flea --default`; `flea --default off` removes the block whole.
hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager", { launch = 'flea --gui' })
hl.unbind("SUPER + ALT + SHIFT + F")
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", { launch = 'flea --gui "$(omarchy-cmd-terminal-cwd)"' })
-- flea --default: end.

-- flea --picker: begin. Written by `flea --picker`; `flea --picker off` removes the block whole.
o.window("com.thisisgm.flea.picker", { tag = "+floating-window" })
-- flea --picker: end.

-- hyprmoncfg monitor layouts panel
o.bind("SUPER + CTRL + M", "Monitor layouts", "omarchy-shell shell summon crmne.hyprmoncfg '{}'")

-- Oma-do-wa docker-compose monitor panel (oma_do_wa plugin)
o.bind("SUPER + ALT + D", "Oma-do-wa", "omarchy-shell oma_do_wa toggle")

-- SUPER + CTRL + D was previously bound to: Display (omarchy.monitor)
hl.unbind("SUPER + CTRL + D")
o.bind("SUPER + CTRL + D", "Display (hyprmoncfg)", "omarchy-shell shell summon crmne.hyprmoncfg '{}'")

-- Second brain: open a terminal in the vault with Claude Code running
o.bind("SUPER + ALT + O", "Second brain (Claude)", { launch = "xdg-terminal-exec --dir=/home/nausica/Downloads/work/second_brain bash -ic claude" })

-- SUPER + CTRL + W was previously bound to: Background switcher (still on SUPER + CTRL + SPACE)
o.rebind("SUPER + CTRL + W", "Network", { panel = "omarchy.network" })
-- SUPER + CTRL + N was previously bound to: Network
o.rebind("SUPER + CTRL + N", "Toggle nightlight", "omarchy toggle nightlight")

-- Screen brightness, next to the volume keys on comma and period
-- SUPER + ALT + comma was previously bound to: Dismiss last notification
o.rebind("SUPER + ALT + comma", "Brightness down", { brightness = "lower" }, { locked = true, repeating = true })
o.bind("SUPER + ALT + PERIOD", "Brightness up", { brightness = "raise" }, { locked = true, repeating = true })
