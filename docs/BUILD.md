# Ng'anjo OS — Build Guide
**Creator: Nehemiah Ng'anjo**

---

## Requirements

| Item | Minimum |
|---|---|
| OS | Arch Linux or any Arch-based distro |
| RAM | 4 GB (8 GB recommended) |
| Disk | 20 GB free space |
| Internet | Required (downloads packages) |
| Tools | `archiso`, `git`, `sudo` |

Install archiso:
```bash
sudo pacman -S archiso git
```

---

## Quick Build

```bash
# 1. Clone the repository
git clone https://github.com/nganjo/nganjo-os.git
cd nganjo-os

# 2. Build the ISO
sudo bash scripts/build.sh

# 3. Find your ISO
ls -lh output/nganjo-os-*.iso
```

Estimated build time: **20–45 minutes** depending on hardware and mirrors.
Estimated ISO size: **~3–4 GB**

---

## Clean Build

To remove all previous build artifacts before starting fresh:

```bash
sudo bash scripts/build.sh --clean
```

---

## Build + Auto-Test

```bash
sudo bash scripts/build.sh --test
```

This builds the ISO and immediately launches it in QEMU (UEFI mode).

---

## Manual QEMU Testing

```bash
# UEFI mode (recommended)
sudo bash scripts/test_iso.sh --uefi output/nganjo-os-*.iso

# BIOS/Legacy mode
sudo bash scripts/test_iso.sh --bios output/nganjo-os-*.iso
```

---

## Write to USB

```bash
sudo dd bs=4M \
    if=output/nganjo-os-YYYY.MM.DD-x86_64.iso \
    of=/dev/sdX \
    status=progress oflag=sync
```

Replace `/dev/sdX` with your USB device (use `lsblk` to identify it).

> **Warning:** This overwrites the entire USB device.

---

## Verify ISO Integrity

```bash
sha256sum -c output/nganjo-os-*.iso.sha256
```

---

## Notes

- AUR packages (Papirus icons, Bibata cursor, GNOME extensions) are installed via `scripts/setup_chroot.sh` — they cannot go in `packages.x86_64` directly
- The `dconf` database is compiled inside the build chroot automatically
- Both UEFI (systemd-boot) and BIOS (GRUB + syslinux) boot modes are supported

---

*Ng'anjo OS — Built on Arch. Engineered to run anywhere.*
*Creator: Nehemiah Ng'anjo*
