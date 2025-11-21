return {
    'mfussenegger/nvim-dap',
    keys = {
        { '<f5>',  function() require('dap').continue() end,          mode = { 'n', 'i', 'x' } },
        { '<f9>',  function() require('dap').toggle_breakpoint() end, mode = { 'n', 'i', 'x' } },
        { '<f10>', function() require('dap').step_over() end,         mode = { 'n', 'i', 'x' } },
        { '<f11>', function() require('dap').step_into() end,         mode = { 'n', 'i', 'x' } },
        { '<f12>', function() require('dap').step_out() end,          mode = { 'n', 'i', 'x' } },
    },
    config = function()
        local dap = require('dap')

        dap.adapters.gdb = {
            type = 'executable',
            command = 'gdb',
            args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
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

        require('overseer').enable_dap()
    end,
}
