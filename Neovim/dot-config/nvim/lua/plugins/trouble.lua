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
        {
            '<leader>xx',
            '<cmd>Trouble diagnostics toggle<cr>',
            desc = 'Diagnostics',
        },
        {
            '<leader>xX',
            '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
            desc = 'Buffer Diagnostics',
        },
        {
            '<leader>xs',
            '<cmd>Trouble symbols toggle focus=false<cr>',
            desc = 'Symbols',
        },
        {
            '<leader>xl',
            '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
            desc = 'LSP Definitions',
        },
        {
            '<leader>xL',
            '<cmd>Trouble loclist toggle<cr>',
            desc = 'Location List',
        },
        {
            '<leader>xQ',
            '<cmd>Trouble qflist toggle<cr>',
            desc = 'Quickfix List',
        },
    },
}
