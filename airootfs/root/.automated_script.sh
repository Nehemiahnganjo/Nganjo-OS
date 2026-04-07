#!/usr/bin/env bash
# Ng'anjo OS — Live Session Automated Init Script
# Creator: Nehemiah Ng'anjo

# ── Set live user passwords ────────────────────────────────────────────────────
echo "nganjo:nganjo" | chpasswd 2>/dev/null || true
echo "root:nganjo"   | chpasswd 2>/dev/null || true

# ── Set default shell to zsh ──────────────────────────────────────────────────
command -v zsh &>/dev/null && {
    chsh -s /bin/zsh root 2>/dev/null || true
    chsh -s /bin/zsh nganjo 2>/dev/null || true
}

# ── Create nganjo home dirs ────────────────────────────────────────────────────
mkdir -p /home/nganjo/{Desktop,Documents,Downloads,Music,Pictures,Videos,Templates,Public}
chown -R nganjo:nganjo /home/nganjo

# ── Enable services ───────────────────────────────────────────────────────────
systemctl enable --now NetworkManager 2>/dev/null || true
systemctl enable --now bluetooth 2>/dev/null || true
systemctl enable --now avahi-daemon 2>/dev/null || true
systemctl enable --now systemd-timesyncd 2>/dev/null || true

# ── Enable linger ─────────────────────────────────────────────────────────────
loginctl enable-linger nganjo 2>/dev/null || true

# ── Compile dconf database ────────────────────────────────────────────────────
dconf update 2>/dev/null || true

exit 0
