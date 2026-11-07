# boot-power

Uses the balanced power profile while the Omarchy desktop loads, then puts back the profile Omarchy saved for the current power source.

**Why:** `power-profiles-daemon` restores the last profile at boot. After a shutdown on battery that's power-saver, so the Omarchy shell takes about 15 seconds to load and the screen stays black meanwhile. See also omacom/owe#35.

**What it does:** if the profile is power-saver at login, `boot-balanced.sh` switches to balanced. It waits until `omarchy-shell shell ping` answers (at most 60 seconds) plus 5 seconds more, then runs `omarchy-powerprofiles-set autodetect`. If the profile was changed by hand in the meantime, it leaves it alone.

## Install

```bash
systemctl --user enable /home/nausica/Downloads/work/omarchy_scripts/boot-power/boot-balanced.service
```

## Remove

```bash
systemctl --user disable boot-balanced.service
```
