# This file is sourced by bash when it is started interactively.

# Only on tty1, not already in Wayland
if [[ $(tty) == /dev/tty1 && -z $WAYLAND_DISPLAY ]]; then
  # Kick brightness to 100% before Sway starts
  brightnessctl set 100%

  # Now replace this shell with Sway
  exec sway
fi
