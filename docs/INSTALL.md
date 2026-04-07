# Ng'anjo OS — Installation Guide
**Creator: Nehemiah Ng'anjo**

---

## Before You Begin

- Back up any important data
- Ensure your system meets the minimum requirements (1 GB RAM, 20 GB disk)
- Download the ISO and write it to a USB drive

---

## Minimum System Requirements

| Component | Minimum | Recommended |
|---|---|---|
| CPU | x86_64, 1 GHz | Dual-core 2 GHz+ |
| RAM | 1 GB | 4 GB |
| Disk | 20 GB | 40 GB |
| GPU | Any VGA-compatible | Intel/AMD/NVIDIA |
| Boot | BIOS or UEFI | UEFI |

---

## Boot from USB

1. Insert the USB drive
2. Restart your computer
3. Enter BIOS/UEFI (usually F2, F12, Del, or Esc)
4. Set USB as the first boot device
5. Save and reboot

You will be greeted by the **Ng'anjo OS boot menu**.

---

## Live Session

After booting, the Ng'anjo OS live session starts automatically with the GNOME desktop.

**Live credentials:**
- Username: `nganjo`
- Password: `nganjo`

You can try the full system before installing anything.

---

## Graphical Installation (Calamares)

1. Click **Install Ng'anjo OS** on the desktop, or run:
   ```bash
   nganjo-installer
   ```
2. Select your **language**
3. Set your **timezone** and **locale**
4. Choose your **keyboard layout**
5. **Partition** your disk:
   - **Erase disk** (recommended for new installs) — automatic btrfs layout
   - **Alongside existing OS** — dual boot
   - **Manual** — full control
6. Create your **user account**
7. Review the **summary** and click **Install**
8. Reboot when complete

---

## Partition Layout (Auto)

| Mount | Filesystem | Size |
|---|---|---|
| `/boot/efi` | FAT32 | 512 MB |
| `[swap]` | swap | 4 GB (or RAM size) |
| `/` | btrfs | Remaining disk |

**Btrfs subvolumes created automatically:**
```
@           → /
@home       → /home
@var        → /var
@snapshots  → /.snapshots
@cache      → /var/cache
@log        → /var/log
```

---

## After Installation

On first login, run the post-install setup:
```bash
sudo nganjo-setup
```

This will:
- Update all packages
- Install the `yay` AUR helper
- Enable the UFW firewall and AppArmor
- Optimize pacman mirrors with reflector
- Add the Flathub Flatpak repository
- Set up developer toolchain helpers
- Configure Timeshift btrfs snapshots

---

## Dual Boot with Windows

1. In the Calamares partitioner, choose **Alongside**
2. Ng'anjo OS will detect Windows automatically
3. GRUB will show both options at boot

> **Tip:** Disable Fast Startup in Windows before dual-booting to avoid filesystem conflicts.

---

*Ng'anjo OS — Runs on any hardware.*
*Creator: Nehemiah Ng'anjo*
