return {
    'stevearc/overseer.nvim',
    keys = {
        { '<f8>', function() require('overseer').toggle() end, desc = 'Toggle overseer window' }
    },
    opts = {
        task_list = {
            max_height = 12,
            min_height = 12,
        }
    },
}
