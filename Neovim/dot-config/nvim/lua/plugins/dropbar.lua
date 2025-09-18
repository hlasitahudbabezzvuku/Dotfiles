vim.keymap.set('n', '<leader>j', function() require('dropbar.api').pick() end)
vim.keymap.set('n', '<leader>[', function() require('dropbar.api').goto_context_start() end)
vim.keymap.set('n', '<leader>]', function() require('dropbar.api').select_next_context() end)

return {
    'Bekaboo/dropbar.nvim',
    event = 'BufRead',
    opts = {}
}
