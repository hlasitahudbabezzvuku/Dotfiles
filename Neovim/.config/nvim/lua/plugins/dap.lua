vim.keymap.set({ 'n', 'i', 'x' }, '<f5>', function() require('dap').continue() end)

vim.keymap.set({ 'n', 'i', 'x' }, '<f9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set({ 'n', 'i', 'x' }, '<f10>', function() require('dap').step_over() end)
vim.keymap.set({ 'n', 'i', 'x' }, '<f11>', function() require('dap').step_into() end)
vim.keymap.set({ 'n', 'i', 'x' }, '<f12>', function() require('dap').step_out() end)

return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        dap.adapters.lldb = {
            type = 'executable',
            command = 'lldb-dap',
            name = 'lldb'
        }

        dap.adapters.coreclr = {
            type = 'executable',
            command = 'netcoredbg',
            args = { '--interpreter=vscode' }
        }

        local lldb = {
            name = 'Launch lldb',
            type = 'lldb',
            request = 'launch',
            cwd = '${workspaceFolder}',
            program = function()
                if BuildTarget == nil then
                    return vim.fn.input('Path to executable', vim.fn.getcwd(), 'file')
                else
                    return BuildTarget
                end
            end,
            stopOnEntry = false,
        }

        local netcoredbg = {
            name = 'Launch netcoredbg',
            type = 'coreclr',
            request = 'launch',
            cwd = '${workspaceFolder}',
            program = function()
                if BuildTarget == nil then
                    return vim.fn.input('Path to executable', vim.fn.getcwd(), 'file')
                else
                    return BuildTarget
                end
            end,
        }

        dap.configurations.c = { lldb }
        dap.configurations.cpp = { lldb }
        dap.configurations.cs = { netcoredbg }
    end,
}
