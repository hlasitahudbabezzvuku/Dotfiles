return {
    'stevearc/overseer.nvim',
    dependencies = {
        'https://codeberg.org/mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
    },
    keys = {
        {
            '<f5>',
            function()
                local adapters = {}
                for k in pairs(require('dap').adapters or {}) do
                    table.insert(adapters, k)
                end

                local tasks = {}
                require('overseer.template').list({ dir = vim.fn.getcwd() }, function(templates)
                    local seen = {}
                    for _, tmpl in ipairs(templates or {}) do
                        if tmpl.name and not seen[tmpl.name] then
                            seen[tmpl.name] = true
                            table.insert(tasks, tmpl.name)
                        end
                    end
                end)

                require('modules.project').configure(adapters, tasks, require('dap').continue)
            end,
            desc = 'Launch project'
        },
        { '<f6>', function() require('overseer.commands').run_template({}) end, desc = 'Launch generic task' },
        {
            '<f7>',
            function()
                require('dapui').close()
                require('overseer').toggle()
            end,
            desc = 'Toggle Overseer UI'
        },
        {
            '<f8>',
            function()
                require('overseer').close()
                require('dapui').toggle()
            end,
            desc = 'Toggle DAP UI'
        },
    },
    config = function()
        local overseer = require('overseer')

        overseer.setup({
            task_list = {
                max_height = 12,
                min_height = 12,
            }
        })

        overseer.add_template_hook({ name = '.*' }, function(_, _)
            require('dapui').close()
            overseer.open()
        end)
    end
}
