return {
    'https://codeberg.org/mfussenegger/nvim-dap',
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            dependencies = { 'nvim-neotest/nvim-nio' },
            opts = {
                layouts = {
                    {
                        position = 'right',
                        size = 36,
                        elements = {
                            { id = 'stacks',  size = 0.25 },
                            { id = 'scopes',  size = 0.50 },
                            { id = 'watches', size = 0.25 },
                        },
                    },
                    {
                        position = 'bottom',
                        size = 12,
                        elements = {
                            { id = 'console', size = 0.5 },
                            { id = 'repl',    size = 0.5 },
                        },
                    },
                },
            },
        }
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        for _, file in ipairs(vim.api.nvim_get_runtime_file('lua/debuggers/*.lua', true)) do
            local mod_name = vim.fn.fnamemodify(file, ':t:r')
            require('debuggers.' .. mod_name)
        end
    end
}
