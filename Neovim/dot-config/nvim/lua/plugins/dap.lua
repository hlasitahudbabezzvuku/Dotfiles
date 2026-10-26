return {
    {
        'https://codeberg.org/mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'jay-babu/mason-nvim-dap.nvim',
        },
        keys = {
            {
                '<f5>',
                function()
                    if not vim.uv.fs_stat('.nvim.lua') then
                        if vim.fn.input('No .nvim.lua found. Generate one? [y/N]: '):lower() ~= 'y' then return end

                        local build_cmd = vim.fn.input('Build command: ')
                        if build_cmd == '' then return end

                        local exec_path = vim.fn.input('Executable path: ', '${workspaceFolder}/', 'file')
                        if exec_path == '' then return end

                        local list = vim.split(build_cmd, '%s+', { trimempty = true })
                        local cmd = string.format('%q', list[1] or '')
                        local args = vim.iter(list):skip(1):map(function(a) return string.format('%q', a) end):join(', ')

                        local raw = table.concat(vim.fn.readfile(vim.fn.stdpath('config') .. '/templates/nvim.lua'), '\n')
                        local final = string.format(raw, cmd, args, exec_path)

                        vim.fn.writefile(vim.split(final, '\n'), '.nvim.lua')
                        dofile('.nvim.lua')
                        vim.notify('.nvim.lua created and loaded', vim.log.levels.INFO)
                    end

                    require('dap').continue()
                end,
                desc = 'DAP project'
            },
            { '<f6>',  function() require('dap').continue() end,          desc = 'DAP continue' },
            { '<f9>',  function() require('dap').toggle_breakpoint() end, desc = 'DAP toggle breakpoint' },
            { '<f10>', function() require('dap').step_over() end,         desc = 'DAP step-over' },
            { '<f11>', function() require('dap').step_into() end,         desc = 'DAP step-into' },
            { '<f12>', function() require('dap').step_out() end,          desc = 'DAP step-out' },
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')

            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

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
    },
}
