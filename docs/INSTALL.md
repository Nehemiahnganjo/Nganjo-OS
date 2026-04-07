# Install Guide

## Boot the ISO

1. Write the ISO to a USB drive:
   ```bash
   sudo dd bs=4M if=out/nganjo-os-*.iso of=/dev/sdX status=progress oflag=sync
   ```
2. Boot from USB (ensure UEFI mode is enabled in BIOS)
3. The live session will auto-login as user `nganjo`

## Graphical Install (Calamares)

1. Click **Install Ng'anjo OS** on the desktop or run `nganjo-installer`
2. Follow the steps:
   - Language & locale
   - Keyboard layout
   - Disk partitioning (auto or manual)
   - User account creation
   - Summary → Install
3. Reboot when prompted

## Post-Install Setup

On first boot, run:

```bash
sudo nganjo-setup
```

This will:
- Update all packages
- Install `yay` AUR helper
- Enable UFW firewall (deny incoming, allow outgoing)
- Enable AppArmor
- Optimize pacman mirrors with reflector
- Add Flathub repository

## Default Credentials (Live Session)

| User | Password |
|------|----------|
| `nganjo` | `nganjo` |
| `root` | `nganjo` |

> These credentials are removed after installation. You set your own password during the Calamares install.

## Partitioning Recommendations

| Partition | Size | Filesystem |
|-----------|------|------------|
| EFI | 512 MB | FAT32 |
| `/` | 20 GB+ | ext4 / btrfs |
| swap | RAM size | zram (auto) |

> zram swap is configured automatically — no swap partition needed.

## Troubleshooting

**Black screen on boot:**  
Add `nomodeset` to kernel parameters (use the VM boot entry in GRUB).

**Calamares not found:**  
Connect to internet and run:
```bash
yay -S calamares
```

**No sound:**  
PipeWire should auto-start. If not:
```bash
systemctl --user enable --now pipewire pipewire-pulse wireplumber
```
