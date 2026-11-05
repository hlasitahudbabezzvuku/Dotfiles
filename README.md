# HlasitaHudbaBezZvuku .files

This repository contains my personal dotfiles from my laptop, Termux and RPi server.

> [!IMPORTANT]
> This is the new repo I made after migrating from Hyprland in 2024. The old dotfiles from my Hyprland desktop are not available anymore.

## Philosophy

I have landed in the middle of the minimalism vs features question. No bloated DE, but also no "compile your own WM or no GUI for you :D". The goal is to eliminate friction and reduce cognitive load:
- Fedora as my OS (minimal install from net-install ISO). I wanted a clean slate without the overhead of a preconfigured workstation.
- Niri as my compositor. It provides a powerful, scroll-based layout that stays out of my way while remaining flexible.
- Noctalia (v5) as my shell. It offers the right balance of feature density and customizability.
- I rely heavily on systemd user services and timers. Rather than relying on brittle startup scripts, I treat my environment as a set of managed services. If a task is repetitive, it is automated via a unit file.

## Deployment

I use **GNU Stow** to manage the symlinking of these configurations. Your distro will definitely have it packaged.

To deploy a package:
```bash
stow <package>
```

To remove a package:
```bash
stow --delete <package>
```

> [!NOTE]
> Sometimes you'll have to rerun `stow <package>`, because stow doesn't always link the whole directory, but just the individual files.

## Note

These files are a reflection of my own specific workflow and hardware requirements. They aren't designed as a template for others to follow, but rather as a personal record of a system that finally feels stable and intuitive.

