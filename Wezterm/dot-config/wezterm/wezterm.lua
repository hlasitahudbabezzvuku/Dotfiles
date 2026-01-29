local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font_with_fallback({
    'JetBrains Mono',
    { family = 'Symbols Nerd Font Mono', scale = 0.75 },
})

return config
