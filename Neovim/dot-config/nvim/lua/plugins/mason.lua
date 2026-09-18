return {
    {
        'mason-org/mason-lspconfig.nvim',
        event = 'BufReadPre',
        opts = {
            automatic_enable = true,
            ensure_installed = { 'lua_ls' },
        },
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
    },
    {
        'mason-org/mason.nvim',
        cmd = 'Mason',
        opts = {
            ui = {
                border = 'rounded',
                width = 0.8,
                height = 0.7,
                icons = {
                    package_installed = '',
                    package_pending = '',
                    package_uninstalled = '',
                }
            }
        }
    }
}
