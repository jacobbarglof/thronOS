
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  brightnessctl set 100%
  exec sway
fi
