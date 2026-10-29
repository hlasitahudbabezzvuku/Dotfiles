return {
    'stevearc/overseer.nvim',
    keys = {
        { '<f6>', function() require('overseer.commands').run_template({}) end, desc = 'Launch generic task' },
        { '<f8>', function() require('overseer').toggle() end,                  desc = 'Toggle overseer window' },
    },
    opts = {
        task_list = {
            max_height = 12,
            min_height = 12,
        }
    },
}
