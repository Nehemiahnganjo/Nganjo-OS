# Ng'anjo OS — Changelog
**Creator: Nehemiah Ng'anjo**

---

## 1.0-lite — "Arise" (2025)

### Initial Release

**System**
- Arch Linux base with Linux kernel + Linux LTS kernel (dual boot entries)
- Intel & AMD microcode auto-loaded at boot
- systemd init, NetworkManager, PipeWire audio stack
- UEFI (systemd-boot) + BIOS (GRUB + syslinux) boot support

**Desktop**
- GNOME with Wayland-first (XWayland fallback)
- GDM login manager with Ng'anjo OS dark branding
- Dash to Dock, Blur my Shell, AppIndicator extensions pre-installed
- Papirus-Dark icon theme, Bibata Modern Ice cursor
- JetBrains Mono monospace, Noto Sans UI font

**Hardware Support**
- Intel iGPU (i915/Iris Xe), AMD GPU (amdgpu), NVIDIA (nouveau open)
- Broadcom, Realtek, Intel, Atheros Wi-Fi via linux-firmware
- BlueZ Bluetooth + PipeWire
- libinput touchpad support
- CUPS printing (HPLIP, Gutenprint)

**Security**
- UFW firewall (deny incoming by default)
- AppArmor enabled with default profiles
- Firejail available for sandboxing
- SHA-512 password hashing
- Optional LUKS2 full-disk encryption via Calamares

**Tools included**
- zsh with autosuggestions, syntax highlighting
- git, python3, nodejs, gcc, neovim, htop, btop, fastfetch
- flatpak + Flathub ready
- VLC, GIMP, LibreOffice Fresh, Firefox

**Build system**
- archiso-based, single `build.sh` entrypoint
- Reproducible builds with SHA256 checksums
- QEMU test launcher included
- Calamares graphical installer configured

---

## Planned — 1.1

- Improved NVIDIA proprietary driver option in setup
- Secure Boot support (signed GRUB shim)
- Wayland polish improvements
- Ng'anjo OS welcome app (GTK4 native instead of TUI)

## Planned — 2.0

- Custom kernel configuration patches for responsiveness
- Ng'anjo OS System Tools native app
- OEM mode support

---

*Creator: Nehemiah Ng'anjo | nganjo-os.org*
