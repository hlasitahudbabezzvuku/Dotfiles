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
        { '<f7>', function() require('modules.layout').toggle('overseer') end,  desc = 'Toggle Overseer UI' },
    },
    config = function()
        local overseer = require('overseer')
        local layout = require('modules.layout')

        layout.register('overseer', {
            open = overseer.open,
            close = overseer.close,
            is_open = overseer.is_task_list_visible,
        })

        overseer.setup({
            task_list = {
                max_height = 12,
                min_height = 12,
            }
        })

        overseer.add_template_hook({ name = '.*' }, function(_, _)
            layout.open('overseer')
        end)
    end
}
