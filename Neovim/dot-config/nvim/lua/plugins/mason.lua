return {
    {
        'mason-org/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonUpdate', 'MasonLog' },
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
    },
    {
        'mason-org/mason-lspconfig.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'neovim/nvim-lspconfig',
            'mason-org/mason.nvim'
        },
        opts = {
            automatic_enable = true,
            ensure_installed = { 'lua_ls' },
        },
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        opts = { handlers = {} },
    },
}
