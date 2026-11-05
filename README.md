# HlasitaHudbaBezZvuku .files

This repository contains my personal dotfiles from my laptop, Termux and RPi server.

> [!IMPORTANT]
> This is the new repo I made after migrating from Hyprland in 2024. The old dotfiles from my Hyprland desktop are not available anymore.

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

