return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        delay = 750,
        win = {
            no_overlap = false,
            width = 80,
            height = { min = 20, max = 32 },
            padding = { 2, 4 },
            col = 0.5,
            row = 7,
            border = 'rounded',
        },
        layout = {
            width = 80,
            spacing = 0,
        },
        icons = { mappings = false }
    },
}
