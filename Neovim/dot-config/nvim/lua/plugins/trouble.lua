return {
    'folke/trouble.nvim',
    event = 'BufRead',
    opts = {
        modes = {
            diagnostics = {
                auto_open = false,
                auto_close = false,
                auto_preview = false,
                open_no_results = true,
            },
        },
    },
    cmd = 'Trouble',
    keys = {
        { '<leader>xx', '<cmd>Trouble diagnostics toggle focus=false<cr>', desc = 'Diagnostics', },
        { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>',     desc = 'Symbols', },
        { '<leader>xq', '<cmd>Trouble qflist toggle focus=false<cr>',      desc = 'Quickfix List', },
    },
}
