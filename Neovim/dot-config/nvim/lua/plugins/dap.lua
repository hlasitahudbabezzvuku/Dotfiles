vim.keymap.set({ 'n', 'i', 'x' }, '<f5>', function() require('dap').continue() end)

vim.keymap.set({ 'n', 'i', 'x' }, '<f9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set({ 'n', 'i', 'x' }, '<f10>', function() require('dap').step_over() end)
vim.keymap.set({ 'n', 'i', 'x' }, '<f11>', function() require('dap').step_into() end)
vim.keymap.set({ 'n', 'i', 'x' }, '<f12>', function() require('dap').step_out() end)

return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require('dap')

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
        }

        dap.adapters.lldb = {
            type = 'executable',
            command = 'lldb-dap',
        }

        dap.adapters.coreclr = {
            type = 'executable',
            command = 'netcoredbg',
            args = { '--interpreter=vscode' },
        }
    end,
}
