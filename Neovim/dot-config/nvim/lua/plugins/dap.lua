return {
    {
        'https://codeberg.org/mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'jay-babu/mason-nvim-dap.nvim',
        },
        keys = {
            { '<f8>',  function() require('modules.layout').toggle('dapui') end, desc = 'Toggle DAP UI' },
            { '<f9>',  function() require('dap').toggle_breakpoint() end,        desc = 'DAP toggle breakpoint' },
            { '<f10>', function() require('dap').step_over() end,                desc = 'DAP step-over' },
            { '<f11>', function() require('dap').step_into() end,                desc = 'DAP step-into' },
            { '<f12>', function() require('dap').step_out() end,                 desc = 'DAP step-out' },
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            local layout = require('modules.layout')

            layout.register('dapui', {
                open = dapui.open,
                close = dapui.close,
                is_open = dapui.is_open,
            })

            dap.listeners.before.attach.dapui_config = function() layout.open('dapui') end
            dap.listeners.before.launch.dapui_config = function() layout.open('dapui') end

            vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpointColor', linehl = '', numhl = '' })
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'https://codeberg.org/mfussenegger/nvim-dap',
        },
        opts = {
            layouts = {
                {
                    position = 'right',
                    size = 48,
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
    },
}
