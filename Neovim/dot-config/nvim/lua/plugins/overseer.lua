return {
    'stevearc/overseer.nvim',
    keys = {
        { '<f6>', function() require('overseer.commands').run_template({}) end, desc = 'Launch generic task' },
        { '<f8>', function() require('overseer').toggle() end,                  desc = 'Toggle overseer window' },
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
            overseer.open()
        end)
    end
}
