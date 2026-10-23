return {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'https://codeberg.org/mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        for _, file in ipairs(vim.api.nvim_get_runtime_file('lua/dap/*.lua', true)) do
            local mod_name = vim.fn.fnamemodify(file, ':t:r')
            require('dap.' .. mod_name)
        end
    end
}
