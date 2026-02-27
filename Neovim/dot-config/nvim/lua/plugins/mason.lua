return {
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        opts = {
            ui = {
                border = 'rounded',
                width = 0.8,
                height = 0.7,
                icons = {
                    package_installed = '',
                    package_pending = '',
                    package_uninstalled = ''
                }
            }
        }
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        opts = {
            ensure_installed = { 'clangd', 'lua_ls', 'bashls' },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            }
        }
    }
}
