# Ng'anjo OS

**Version:** 1.0 Lite — "Arise"  
**By:** Nehemiah Ng'anjo  
**Base:** Arch Linux | x86_64

---

## Editions

| Edition | Desktop | Status |
|---------|---------|--------|
| **Ng'anjo OS GNOME** | GNOME on Wayland | ✅ Available |
| **Ng'anjo OS KDE** | KDE Plasma on Wayland | 🔧 In Development |
| **Ng'anjo OS Neo** | Rust/egui Desktop | 🔧 In Development |
| **Ng'anjo OS TUI** | Terminal only, no DE | ✅ Available |

---

## What is this?

A custom Linux distribution built on Arch. Ships in four editions — GNOME, KDE Plasma, NeoDesktop (Rust/egui), and TUI — all on Wayland. Includes a graphical Calamares installer and works on most x86_64 hardware out of the box.

---

## Features

- GNOME or KDE Plasma on Wayland — clean, minimal, no bloat
- Calamares graphical installer
- Zsh with autosuggestions, syntax highlighting, and fzf
- PipeWire audio stack
- Bluetooth support out of the box
- zram swap — better performance on low-RAM machines
- Plymouth boot animation
- CPU governor + I/O scheduler tuning
- Firefox pre-installed, Flatpak ready
- AppArmor + UFW enabled by default

---

## Requirements

- 64-bit CPU, 2+ cores
- 2 GB RAM minimum (4 GB recommended)
- 20 GB disk space
- UEFI firmware (no legacy BIOS support)

---

## How to Build

Requires an Arch Linux host with `archiso` installed.

```bash
# Install archiso
sudo pacman -S archiso

# Build default (GNOME) edition
sudo bash scripts/build.sh

# Build a specific edition
sudo bash scripts/build.sh --kde
sudo bash scripts/build.sh --tui
sudo bash scripts/build.sh --neo

# Clean build
sudo bash scripts/build.sh --clean

# Build and test in QEMU
sudo bash scripts/build.sh --test
```

ISO is written to `out/` when complete. Build time is approximately 20–45 minutes depending on hardware and network speed.

---

## Testing

```bash
sudo bash scripts/test_iso.sh --uefi out/nganjo-os-*.iso
```

---

## Writing to USB

```bash
sudo dd bs=4M if=out/nganjo-os-*.iso of=/dev/sdX status=progress oflag=sync
```

Replace `/dev/sdX` with your actual USB device. Verify the target device carefully before running.

---

## Post-Install Setup

Run after first boot:

```bash
sudo nganjo-setup
```

This will:
- Update all packages
- Install yay (AUR helper)
- Configure UFW firewall
- Enable AppArmor
- Refresh mirrors with reflector
- Add Flathub remote

---

## Folder Structure

```
nganjo-os/
├── airootfs/            # OS configs, scripts, and overlays
├── docs/                # Build, install, and changelog docs
├── efiboot/             # UEFI boot configuration
├── grub/                # GRUB bootloader config
├── scripts/             # Build, test, and setup scripts
├── syslinux/            # Legacy BIOS boot (fallback)
├── packages.x86_64      # GNOME edition package list
├── packages.kde.x86_64  # KDE edition package list
├── packages.neo.x86_64  # NeoDesktop edition package list
├── packages.tui.x86_64  # TUI edition package list
├── packages.x86_64.build# Active build list (auto-generated)
├── pacman.conf          # pacman config for the build environment
└── profiledef.sh        # archiso profile definition
```

---

## Documentation

- [Build Guide](docs/BUILD.md)
- [Install Guide](docs/INSTALL.md)
- [Changelog](docs/CHANGELOG.md)
- [Contributing](docs/CONTRIBUTING.md)

---

## License

MIT — see [LICENSE](LICENSE) for details.

---

## Support

Free and open-source. Use it, fork it, ship it.

If it saved you time or money, a coffee is appreciated.

[![Support via PayPal](https://img.shields.io/badge/Support-PayPal-0070ba?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/Nextlinkmw)

<div align="center">

[![$1 — Coffee](https://img.shields.io/badge/☕_$1-Coffee-0070ba?style=flat-square&logo=paypal&logoColor=white)](https://paypal.me/Nextlinkmw/1)
[![$5 — Lunch](https://img.shields.io/badge/🍔_$5-Lunch-0070ba?style=flat-square&logo=paypal&logoColor=white)](https://paypal.me/Nextlinkmw/5)
[![$10 — Fuel](https://img.shields.io/badge/⚡_$10-Fuel-0070ba?style=flat-square&logo=paypal&logoColor=white)](https://paypal.me/Nextlinkmw/10)
[![$20 — You are the GOAT](https://img.shields.io/badge/🐐_$20-GOAT-0070ba?style=flat-square&logo=paypal&logoColor=white)](https://paypal.me/Nextlinkmw/20)

*built for those who arise.*

</div>
