return {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'BufReadPre',
    opts = {
        options = {
            multilines = {
                enabled = true,
                always_show = true,
            }
        },
    },
}
