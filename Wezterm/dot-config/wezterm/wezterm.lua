local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font_with_fallback({
    'JetBrains Mono',
    { family = 'Symbols Nerd Font Mono', scale = 0.75 },
})

config.line_height = 1.1

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

    tab_bar = {
        active_tab = {
            bg_color = '#000000',
            fg_color = '#ffffff',
        },

        inactive_tab = {
            bg_color = '#000000',
            fg_color = '#808080',
        },

        inactive_tab_hover = {
            bg_color = '#000000',
            fg_color = '#ffffff',
        },

        new_tab = {
            bg_color = '#000000',
            fg_color = '#808080',
        },

        new_tab_hover = {
            bg_color = '#000000',
            fg_color = '#ffffff',
        },

        inactive_tab_edge = '#000000',
    },
}

config.window_background_opacity = 0.8
config.kde_window_background_blur = true

config.show_close_tab_button_in_tabs = false
config.show_tab_index_in_tab_bar = false

config.window_frame = {
    font = wezterm.font { family = 'Inter', weight = 'Bold' },
    font_size = 11.0,
    active_titlebar_bg = '#000000',
    inactive_titlebar_bg = '#000000',
}

config.window_content_alignment = {
    horizontal = 'Center',
    vertical = 'Center',
}

return config
