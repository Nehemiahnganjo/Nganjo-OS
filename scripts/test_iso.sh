#!/usr/bin/env bash
# Ng'anjo OS — QEMU ISO Test Launcher
# Creator: Nehemiah Ng'anjo
# Usage: sudo bash scripts/test_iso.sh [--uefi|--bios] <path-to-iso>

set -euo pipefail

TEAL='\033[38;2;0;210;180m'
RED='\033[38;2;255;77;109m'
RESET='\033[0m'

MODE="uefi"
ISO=""

for arg in "$@"; do
    case "$arg" in
        --uefi) MODE="uefi" ;;
        --bios) MODE="bios" ;;
        *.iso)  ISO="$arg"  ;;
    esac
done

[[ -z "$ISO" ]] && { echo -e "${RED}Usage: bash scripts/test_iso.sh [--uefi|--bios] path.iso${RESET}"; exit 1; }
[[ ! -f "$ISO" ]] && { echo -e "${RED}ISO not found: $ISO${RESET}"; exit 1; }

if ! command -v qemu-system-x86_64 &>/dev/null; then
    echo -e "${RED}qemu-system-x86_64 not found. Install: sudo pacman -S qemu-full${RESET}"
    exit 1
fi

echo -e "${TEAL}Launching Ng'anjo OS in QEMU (${MODE})...${RESET}"
echo -e "${TEAL}ISO: ${ISO}${RESET}"
echo ""

if [[ "$MODE" == "uefi" ]]; then
    OVMF="/usr/share/edk2/x64/OVMF.fd"
    [[ ! -f "$OVMF" ]] && OVMF="/usr/share/OVMF/OVMF_CODE.fd"
    [[ ! -f "$OVMF" ]] && { echo -e "${RED}OVMF firmware not found. Install: sudo pacman -S edk2-ovmf${RESET}"; exit 1; }

    qemu-system-x86_64 \
        -enable-kvm \
        -m 4G \
        -smp 4 \
        -cpu host \
        -drive if=pflash,format=raw,readonly=on,file="${OVMF}" \
        -cdrom "$ISO" \
        -boot d \
        -vga virtio \
        -display gtk,zoom-to-fit=on \
        -audiodev pa,id=snd0 \
        -device ich9-intel-hda \
        -device hda-output,audiodev=snd0 \
        -net user -net nic \
        -name "Ng'anjo OS 1.0 Lite [UEFI]"
else
    qemu-system-x86_64 \
        -enable-kvm \
        -m 4G \
        -smp 4 \
        -cpu host \
        -cdrom "$ISO" \
        -boot d \
        -vga virtio \
        -display gtk,zoom-to-fit=on \
        -net user -net nic \
        -name "Ng'anjo OS 1.0 Lite [BIOS]"
fi
