# Build Guide

## what you need

- arch linux machine (or arch based)
- internet connection
- root access

## install deps

```bash
sudo pacman -S archiso
```

## building

```bash
sudo bash scripts/build.sh
```

if you want a clean build (removes old work/ folder first):

```bash
sudo bash scripts/build.sh --clean
```

to build and auto test in qemu:

```bash
sudo bash scripts/build.sh --test
```

## what happens during build

1. checks deps
2. cleans old stuff
3. verifies airootfs
4. stamps build date
5. compiles dconf
6. sets up chroot hook
7. runs mkarchiso (this is the long part)
8. generates sha256 checksum
9. prints output path

the chroot phase needs internet to install aur packages like calamares, papirus icons, bibata cursor etc. if theres no internet it skips those and the iso still boots but the graphical installer wont be there.

## output

iso ends up in `out/` folder. theres also a .sha256 file next to it.

```bash
# verify it
sha256sum -c out/nganjo-os-*.iso.sha256
```
