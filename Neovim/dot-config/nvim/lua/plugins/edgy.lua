return {
    'folke/edgy.nvim',
    event = 'VeryLazy',
    init = function()
        vim.api.nvim_create_autocmd('BufReadPost', {
            callback = function(args)
                if not vim.tbl_contains({ 'gitcommit', 'gitrebase' }, vim.bo[args.buf].filetype) then
                    require('edgy').open()
                end
            end,
        })
    end,
    opts = {
        right = {
            {
                title = 'Filesystem',
                ft = 'neo-tree',
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == 'filesystem'
                end,
                pinned = true,
                open = 'Neotree show position=left filesystem',
            },
            {
                title = 'Git',
                ft = 'neo-tree',
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == 'git_status'
                end,
                pinned = true,
                open = 'Neotree show position=right git_status',
                size = { height = 0.35 },
            },
        },
        bottom = {
            {
                title = 'Diagnostics',
                ft = 'trouble',
                pinned = true,
                open = 'Trouble diagnostics toggle focus=false',
            },
            {
                ft = 'qf',
                title = 'QuickFix',
            },
            {
                ft = 'help',
            },
        },
        exit_when_last = true,
        animate = { enabled = false },
        options = {
            left = { size = 35 },
            bottom = { size = 10 },
            right = { size = 35 },
            top = { size = 10 },
        },
    },
}
