-- TODO: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#git-pickers

return {
    'nvim-telescope/telescope.nvim',
    dependecies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {'<leader>;', function() require('telescope.builtin').builtin() end},
        {'<leader>f', function() require('telescope.builtin').find_files() end},
        {'<leader>g', function() require('telescope.builtin').live_grep() end},
        {'<leader>b', function() require('telescope.builtin').buffers() end},
        {'<leader>k', function() require('telescope.builtin').diagnostics() end},
    },
}
