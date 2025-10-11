return {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('github-theme').setup({
            options = {
                transparent = true,
                styles = {
                    comments = 'italic',
                    keywords = 'bold',
                    types = 'italic,bold',
                }
            },
            groups = {
                all = {
                    TelescopeBorder = { fg = 'bg2' },
                    TelescopePromptTitle = { bg = 'palette.red', fg =  'bg0'},
                    TelescopePreviewTitle = { bg = 'palette.blue', fg =  'bg0'},
                },
            },
        })

        vim.cmd('colorscheme github_dark_default')
    end,
}
