# Contributing

## Getting Started

1. Fork the repository on GitHub
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/nganjo-os.git
   cd nganjo-os
   ```
3. Create a branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## What You Can Contribute

- Bug fixes in build or chroot scripts
- New packages in `packages.x86_64`
- Improved Calamares module configs in `airootfs/etc/calamares/`
- Performance tuning improvements
- Documentation improvements
- Branding assets (wallpapers, icons, Plymouth themes)

## Guidelines

- Test your changes by building the ISO: `sudo bash scripts/build.sh --clean`
- Keep commits focused — one change per commit
- Use clear commit messages: `fix: ...`, `feat: ...`, `docs: ...`
- Do not commit build artifacts (`work/`, `out/`, `*.iso`)

## Submitting a Pull Request

1. Push your branch to your fork
2. Open a Pull Request against `main`
3. Describe what you changed and why

## Reporting Issues

Open an issue at: https://github.com/Nehemiahnganjo/nganjo-os/issues

Include:
- What you expected to happen
- What actually happened
- Steps to reproduce
- Host OS and hardware info
