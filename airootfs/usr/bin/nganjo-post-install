#!/usr/bin/env bash
# Ng'anjo OS — Post-Install Script (run by Calamares shellprocess inside chroot)
# Creator: Nehemiah Ng'anjo

TEAL='\033[38;2;0;210;180m'
RESET='\033[0m'
log() { echo -e "  ${TEAL}[post-install]${RESET} $1"; }

# ── Remove live sudoers override ──────────────────────────────────────────────
rm -f /etc/sudoers.d/nganjo-live
log "Removed live sudoers override."

# ── Configure display manager auto-login for installed user ──────────────────
INSTALL_USER=$(awk -F: '$3 >= 1000 && $3 < 65534 && $1 != "nganjo" {print $1; exit}' /etc/passwd 2>/dev/null)
[[ -z "$INSTALL_USER" ]] && INSTALL_USER="nganjo"

if command -v sddm &>/dev/null; then
    mkdir -p /etc/sddm.conf.d
    cat > /etc/sddm.conf.d/autologin.conf << SDDMCONF
[Autologin]
User=${INSTALL_USER}
Session=plasmawayland
SDDMCONF
    log "SDDM auto-login set for user: ${INSTALL_USER}"
else
    mkdir -p /etc/gdm
    cat > /etc/gdm/custom.conf << GDMCONF
[daemon]
AutomaticLoginEnable=True
AutomaticLogin=${INSTALL_USER}
TimedLoginEnable=False

[security]

[xdmcp]

[chooser]

[debug]
GDMCONF
    log "GDM auto-login set for user: ${INSTALL_USER}"
fi

# ── Disable live-only services ────────────────────────────────────────────────
systemctl disable nganjo-welcome.service 2>/dev/null || true
find /home -name "nganjo-welcome.desktop" -path "*/autostart/*" -delete 2>/dev/null || true
log "Live-only services disabled."

# ── Generate machine-id ───────────────────────────────────────────────────────
rm -f /etc/machine-id
systemd-machine-id-setup 2>/dev/null || true
log "Machine ID generated."

# ── Set locale ────────────────────────────────────────────────────────────────
locale-gen 2>/dev/null || true
log "Locales generated."

# ── Enable essential services ─────────────────────────────────────────────────
systemctl enable NetworkManager 2>/dev/null || true
systemctl enable gdm 2>/dev/null || true
systemctl enable systemd-timesyncd 2>/dev/null || true
log "Essential services enabled."

# ── Apply dconf defaults for installed user ───────────────────────────────────
dconf update 2>/dev/null || true

# Copy skel configs to installed user home
INSTALL_USER=$(awk -F: '$3 >= 1000 && $3 < 65534 && $1 != "nganjo" {print $1; exit}' /etc/passwd 2>/dev/null)
if [[ -n "$INSTALL_USER" ]]; then
    USER_HOME="/home/${INSTALL_USER}"
    # Copy zshrc
    [[ -f /etc/skel/.zshrc ]] && cp /etc/skel/.zshrc "${USER_HOME}/.zshrc"
    # Set zsh as default shell
    chsh -s /bin/zsh "$INSTALL_USER" 2>/dev/null || true
    # Create XDG dirs
    mkdir -p "${USER_HOME}"/{Desktop,Documents,Downloads,Music,Pictures,Videos,Templates,Public}
    chown -R "${INSTALL_USER}:${INSTALL_USER}" "${USER_HOME}"
    log "User home configured for: ${INSTALL_USER}"
fi

# ── First-boot hint ───────────────────────────────────────────────────────────
cat > /etc/profile.d/nganjo-firstboot.sh << 'FIRSTBOOT'
#!/bin/bash
FLAG="${HOME}/.nganjo-setup-done"
if [[ ! -f "$FLAG" ]]; then
    echo ""
    echo "  Welcome to Ng'anjo OS! Run 'sudo nganjo-setup' to finish setting up."
    echo ""
    touch "$FLAG"
fi
FIRSTBOOT
chmod +x /etc/profile.d/nganjo-firstboot.sh
log "First-boot hint installed."

log "Post-install complete."
