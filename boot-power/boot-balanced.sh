#!/bin/bash
# Use the balanced power profile while the desktop loads, then put back the
# profile Omarchy saved for the current power source (AC or battery).
#
# Why: power-profiles-daemon restores the last profile at boot. After a
# shutdown on battery that's power-saver, which roughly doubles how long the
# Omarchy shell takes to load (black screen at login).

set -u

current=$(powerprofilesctl get 2>/dev/null) || exit 0
[[ $current == power-saver ]] || exit 0

powerprofilesctl set balanced || exit 0

# Wait (max 60 s) until the shell answers IPC, then give it a few seconds to
# finish loading its plugins.
end=$((SECONDS + 60))
until omarchy-shell shell ping >/dev/null 2>&1; do
  (( SECONDS >= end )) && break
  sleep 0.5
done
sleep 5

# Leave it alone if Kris picked a profile by hand in the meantime.
[[ $(powerprofilesctl get 2>/dev/null) == balanced ]] || exit 0

# With no profile argument this applies the saved profile for the current
# power source without changing what's saved.
omarchy-powerprofiles-set autodetect
