return {
    {
        'mason-org/mason-lspconfig.nvim',
        event = 'BufReadPre',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        opts = {
            automatic_enable = true,
            ensure_installed = { 'lua_ls' },
        },
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        opts = { handlers = {} },
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        }
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
