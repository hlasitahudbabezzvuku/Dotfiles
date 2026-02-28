return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        opts = {
            signcolumn              = false,
            numhl                   = true,
            current_line_blame      = true,
            current_line_blame_opts = {
                virt_text = true,
                delay = 750,
                ignore_whitespace = true,
            },
        },
        keys = {
            { '<leader>d', '<cmd>Gitsigns diffthis<cr>', desc = 'Diagnostics', },
        },
    },
    {
        'sindrets/diffview.nvim',
        event = 'BufRead',
        opts = {}
    }
}
