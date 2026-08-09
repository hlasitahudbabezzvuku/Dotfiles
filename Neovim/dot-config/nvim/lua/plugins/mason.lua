return {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    event = 'VeryLazy',
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
}
