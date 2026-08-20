# HlasitaHudbaBezZvuku's Dotfiles

This repository contains my personal dotfiles from my laptop, Termux and RPi server.

> [!IMPORTANT]
> This is the new repo I made after migrating from Hyprland in 2024. The old dotfiles from my Hyprland desktop are not available anymore.

## Philosophy

I have landed in the middle of the minimalism vs features question. No bloated DE, but also no "compile your own WM or no GUI for you :D". The goal is to eliminate friction and reduce cognitive load:
- Base: Fedora (minimal install from net-install ISO). I wanted a clean slate without the overhead of a pre-configured workstation.
- Compositor: Niri. It provides a powerful, scroll-based layout that stays out of my way while remaining flexible.
- Shell: Noctalia v5. It offers the right balance of feature density and customizability.
- Orchestration: I rely heavily on systemd user services and timers. Rather than relying on brittle startup scripts, I treat my environment as a set of managed services. If a task is repetitive, it is automated via a unit file.

