# Changelog

## v1.0 Lite — "Arise" (2026-04-07)

### Initial Release

**Base System**
- Arch Linux base with `linux` kernel
- systemd init, zsh default shell
- GNOME 49 on Wayland (GDM auto-login in live session)

**Hardware Support**
- Mesa, Vulkan (Intel + AMD + Nouveau)
- PipeWire audio with WirePlumber
- Bluetooth (bluez)
- NetworkManager with Wi-Fi (iwd/wpa_supplicant)
- zram swap (auto-configured)

**Performance Tuning**
- CPU performance governor via `nganjo-cpu-performance.service`
- I/O scheduler tuning via udev rules
- Kernel sysctl tweaks (vm.swappiness, network, inotify)
- Systemd fast-boot optimizations

**Installer**
- Calamares graphical installer (built from AUR during ISO build)
- Custom Ng'anjo branding and slideshow
- Post-install script (`nganjo-post-install`) runs via Calamares shellprocess

**Branding**
- Custom Plymouth boot theme
- Custom GNOME wallpaper and GDM background
- Papirus Dark icons, Bibata Modern Ice cursor
- adw-gtk3 theme, GNOME extensions (Dash to Dock, AppIndicator, Blur My Shell)

**Applications**
- Firefox (pre-installed)
- Brave (via AUR, optional)
- Flatpak + Flathub ready
- fastfetch, btop, htop, bat, eza, fzf, ripgrep, fd, tmux

**Security**
- UFW firewall
- AppArmor
- GnuPG
