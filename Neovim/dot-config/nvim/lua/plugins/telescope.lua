vim.keymap.set('n', '<leader>h', function() require('telescope.builtin').builtin() end)

vim.keymap.set('n', '<leader>;', function() require('telescope.builtin').commands() end)
vim.keymap.set('n', '<leader>f', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<leader>g', function() require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<leader>b', function() require('telescope.builtin').buffers() end)
vim.keymap.set('n', '<leader>k', function() require('telescope.builtin').diagnostics() end)

-- TODO: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#git-pickers

return {
    'nvim-telescope/telescope.nvim',
    dependecies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        defaults = require('telescope.themes').get_dropdown {}
    }
}
