return {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    config = function()
        vim.keymap.set('n', '<a-h>', require('smart-splits').resize_left)
        vim.keymap.set('n', '<a-j>', require('smart-splits').resize_down)
        vim.keymap.set('n', '<a-k>', require('smart-splits').resize_up)
        vim.keymap.set('n', '<a-l>', require('smart-splits').resize_right)
        -- moving between splits
        vim.keymap.set('n', '<c-h>', require('smart-splits').move_cursor_left)
        vim.keymap.set('n', '<c-j>', require('smart-splits').move_cursor_down)
        vim.keymap.set('n', '<c-k>', require('smart-splits').move_cursor_up)
        vim.keymap.set('n', '<c-l>', require('smart-splits').move_cursor_right)
        vim.keymap.set('n', '<c-\\>', require('smart-splits').move_cursor_previous)
        -- swapping buffers between windows
        vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
        vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
        vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
        vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
    end
}
