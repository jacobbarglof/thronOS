#!/usr/bin/env bash
set -e

# Create user “admin” with password “admin”
useradd -m -G wheel,audio,video,input admin
echo 'admin:admin' | chpasswd

# Enable sudo for wheel
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
systemctl enable NetworkManager
systemctl enable NetworkManager.service
systemctl disable reflector.service reflector.timer
systemctl mask reflector.service
systemctl mask reflector.timer
systemctl enable seatd.service

pacman -U --noconfirm /root/yay-*.pkg.tar.zst
pacman -U --noconfirm /root/edex-ui-*.pkg.tar.zst