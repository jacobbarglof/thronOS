![thronOS logo](https://github.com/user-attachments/assets/588723c7-c6f5-4519-9eef-80859986e857)

# You're Seated on the Thron
[![Arch Build](https://img.shields.io/badge/build-passing-brightgreen?style=flat\&logo=archlinux)](#)

A minimal, customizable Arch Linux ISO powered by ThronOS, featuring a sleek Tron-inspired user interface and a preconfigured ArchISO environment.

This is an early build and NOT RECOMENDED FOR INSTALLATION for anything important. Use privleged commands with caution

---

## Overview

This repository contains the configuration for building a custom Arch Linux live ISO using `archiso`. The ISO includes:

* A preconfigured terminal environment with Tron-themed styles
* Scripts and assets for generating a custom ArchISO

---

## Prerequisites

Before you begin, ensure you have the following:

* A Linux machine to compile into an ISO image
* Internet connectivity
* Sudo privileges

---

## Installation & Build

1. **Install archiso**

   ```bash
   sudo pacman -S --needed archiso
   ```

2. **Clone this repository**

   ```bash
   git clone https://github.com/jacobbarglof/thronOS.git
   cd thronOS/thronos-build
   ```

3. **Generate the ISO**

   ```bash
   mkarchiso -v .
   ```

   * `-v` for verbose output
   * `.` indicates the current directory contains `airootfs/`, `packages.x86_64`, and other configuration files

4. **Move the resulting ISO**

   ```bash
   mv out/*.iso ~/Downloads/
   ```

---

## Usage

1. Burn `~/Downloads/ThronOS-Arch.iso` to a USB drive using a tool such as `dd`, Etcher or Rufus (My personal favorite!).
2. Boot from the USB drive to enter the live environment.

---

## Contributing

Contributions, issues, and feature requests are welcome. Please open an issue or submit a pull request to help improve ThronOS ArchISO.

---

## License

This project is licensed under the [MIT License](LICENSE).
