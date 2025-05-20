
![ThronOS logo](https://github.com/user-attachments/assets/588723c7-c6f5-4519-9eef-80859986e857)

# ThronOS • Tron-Inspired Arch ISO  
[![Arch Build](https://img.shields.io/badge/build-passing-brightgreen?logo=archlinux)](#)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL%20v3-blue)](LICENSE)

> ⚠ **EARLY ALPHA** Use privleged commands with caution.  
> Filesystem alterations on alternate partitions may erase data: double-check every step.

---

## Table of Contents
- [Quick Start](#quick-start)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Build from Source](#build-from-source)
- [Boot & Live Usage](#boot--live-usage)
- [Project Architecture](#project-architecture)
- [License](#license)

---

## Quick Start
```bash
# ❶ clone & build
git clone https://github.com/jacobbarglof/thronOS.git
cd thronOS/thronos-build
sudo pacman -S --needed archiso       # on an Arch host
sudo mkarchiso -v .                   # produces out/ThronOS-*.iso

# ❷ verify
sha256sum -c out/ThronOS-*.iso.sha256

# ❸ flash  (replace /dev/sdX)
sudo dd if=out/ThronOS-*.iso of=/dev/sdX bs=4M status=progress oflag=sync

# ❹ boot  → login  → GUI
user: ttk   (no password)  
$ sway

```
- Upon entering desktop environment, use the keyboard shortcut `Meta + Enter` to open terminal, and `Meta + Q` to exit from a tile. 
---

## Features
* **Sway** desktop themed after *Tron* (Waybar, Kitty, bluish GTK)
* Ultra-portable design
* Reproducible ISO profile powered by **archiso**

---

## Prerequisites
| Item | Minimum |
|------|---------|
| Host OS | Arch Linux (or chroot / Docker with systemd) |
| Packages | `archiso` `git` |
| Disk space | 10 GB free |
| Network | reliable 100 Mbps+ (mirrors + AUR fetches) |
| Privileges | `sudo` access |

---

## Build from Source
1. **Install archiso**  
   ```bash
   sudo pacman -S --needed archiso
   ```
2. **Clone repo & enter profile**  
   ```bash
   git clone https://github.com/jacobbarglof/thronOS.git
   cd thronOS/thronos-build
   ```
3. **Generate ISO** – verbose, in current dir  
   ```bash
   sudo mkarchiso -v .
   ```
4. **Move / verify**  
   ```bash
   mv out/*.iso ~/Downloads/
   sha256sum -c out/*.iso.sha256
   ```

---

## Boot & Live Usage
| Action | Command / Note |
|--------|----------------|
| Burn to USB | `dd if=ThronOS.iso of=/dev/sdX bs=4M status=progress`, Balena Etcher, or Rufus (my personal favorite!) |
| Default creds | **user `ttk`**, passwordless sudo |
| Enter GUI | `sway` (Wayland) |
| Root shell | `sudo -i` |
| Persist custom files | copy to `/run/archiso/cowspace` then `mksquashfs` (see docs/persistence.md) |

---

## Project Architecture
```
thronos-build/
├── airootfs/                # files copied verbatim into live root
│   ├── etc/
│   │   ├── skel/            # user dotfiles  (zshrc, starship.toml)
│   │   └── pacman.conf
│   ├── root/
│   │   └── customize.sh     # post-install hooks (enable services)
│   └── usr/share/plymouth/  # Tron splash
├── packages.x86_64          # master package list
├── profiledef.sh            # archiso build definition (label, hooks)
├── efiboot/
│   └── loader/entries/      # systemd-boot entry
└── out/                     # mkarchiso output dir (ignored by git)
```
*Build flow:* `mkarchiso` → copies `airootfs` → installs packages → writes EFI → compresses SquashFS → emits `ThronOS-<date>-x86_64.iso`.

---


## License
This repo is **MIT**.

> *You are now seated on the Thron.*
