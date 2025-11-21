return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        win = {
            no_overlap = false,
            width = 80,
            height = { min = 20, max = 48 },
            col = 0.5,
            row = 7,
            border = 'rounded',
        },
        icons = { keys = { Space = '+Leader' } },
    },
}
