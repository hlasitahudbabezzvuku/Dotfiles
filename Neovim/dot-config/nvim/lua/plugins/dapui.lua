return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
            {
                'theHamsta/nvim-dap-virtual-text',
                dependencies = { 'mfussenegger/nvim-dap', },
                opts = {}
            }
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')

            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

            dapui.setup({
                force_buffers = true,

                layouts = {
                    {
                        elements = {
                            { id = 'scopes' },
                            { id = 'stacks', size = 0.4 },
                        },
                        position = 'right',
                        size = 45
                    },
                    {
                        elements = {
                            { id = 'repl' },
                        },
                        position = 'bottom',
                        size = 10
                    }
                },

                mappings = {
                    edit = 'e',
                    expand = { '<CR>', '<2-LeftMouse>' },
                    open = 'o',
                    remove = 'd',
                    repl = 'r',
                    toggle = 't'
                },

                render = {
                    indent = 1,
                    max_value_lines = 100
                }
            })
        end
    }
}
