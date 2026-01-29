local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font_with_fallback({
    'JetBrains Mono',
    { family = 'Symbols Nerd Font Mono', scale = 0.75 },
})

config.colors = {
    foreground = '#c9d1d9',
    background = '#000000',

    cursor_bg = '#c9d1d9',
    cursor_fg = '#000000',
    cursor_border = '#c9d1d9',

    selection_fg = '#000000',
    selection_bg = '#5d63f0',

    ansi = {
        '#161b22',
        '#ff7b72',
        '#7ee787',
        '#ffa657',
        '#58a6ff',
        '#797ef9',
        '#d2a8ff',
        '#c9d1d9',
    },
    brights = {
        '#21262d',
        '#ffa198',
        '#aff5b4',
        '#ffc680',
        '#79c0ff',
        '#939aff',
        '#e2c5ff',
        '#f0f6fc',
    },
}

return config
