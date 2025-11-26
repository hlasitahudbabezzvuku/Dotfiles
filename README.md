# HlasitaHudbaBezZvuku's Dotfiles

My personal dotfiles from my laptop, Termux and RPi server.

This is the new repo I made after migrating to KDE Plasma. The old dotfiles from my Hyprland desktop are not avalible any more.

## Hyprland x KDE Plasma

I have used Hyprland for 3 years (started around 2022) and I it got really close to my heart. I build multiple desktops around it with various toolkits and even my own utilities made specificly for my Hyprland setup. But since the comunity problems I switched. First to the River compositor and the to KDE Plasma. I chose KDE Plasma because it works out of the box. I don't have nearly as much time as I have 3 or 2 years ago, I'm finishing my shool this yesr, so chosing a full desktop environment was the better option. Other than that I kept most of my tools the same eg. Bash, Tmux, Neovim, lf, foot, keyd, etc. exept uwsm (I have used it for quite short period of time (~2 months), but I was able to do some awesome things with it, so I would like to rewrite the whole uwsm setup to work with KDE using the Plasma systemd boot).

## GNU Stow

I'm using GNU Stow to manage dotfiles in my home directory. If you want to learn how it works you can read [this](https://www.jakewiesler.com/blog/managing-dotfiles) blog post.

You can pick which packages to install by specifing it's name like this `stow <package>`. The package name is the name of the directory containing the configuration.

If you want to uninstall some package then use `stow --delete <package>`

## Plans

I'm planing to mostly ditch the build in shortcuts in plasma in favor of something more configurable. I had a lot of niche keyboard shortcuts which are not possible in KDE Plasma.

I would also like to migrate my uwsm configuration to the Plasma systemd boot so I can control both the init and the runtime of my desktop much better.

Another thing I would like do is creating a script/plugin that would return my 2.5-dimensional workspace workflow (you wouldn't like this, but I almost cannot live without it).

And the last but not least - I would like to write custom modules for the Plasma DE and maybe soft-fork the plasma panel.

