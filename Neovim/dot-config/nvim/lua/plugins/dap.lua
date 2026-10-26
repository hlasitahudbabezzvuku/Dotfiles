return {
    'https://codeberg.org/mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        for _, file in ipairs(vim.api.nvim_get_runtime_file("lua/debuggers/*.lua", true)) do
            local mod_name = vim.fn.fnamemodify(file, ":t:r")
            require('debuggers.' .. mod_name)
        end
    end
}
