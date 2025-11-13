return {
    'mrjones2014/smart-splits.nvim',
    keys = {
        { '<a-h>',             function() require('smart-splits').resize_left() end },
        { '<a-j>',             function() require('smart-splits').resize_down() end },
        { '<a-k>',             function() require('smart-splits').resize_up() end },
        { '<a-l>',             function() require('smart-splits').resize_right() end },
        { '<c-h>',             function() require('smart-splits').move_cursor_left() end },
        { '<c-j>',             function() require('smart-splits').move_cursor_down() end },
        { '<c-k>',             function() require('smart-splits').move_cursor_up() end },
        { '<c-l>',             function() require('smart-splits').move_cursor_right() end },
        { '<c-\\>',            function() require('smart-splits').move_cursor_previous() end },
        { '<leader><leader>h', function() require('smart-splits').swap_buf_left() end },
        { '<leader><leader>j', function() require('smart-splits').swap_buf_down() end },
        { '<leader><leader>k', function() require('smart-splits').swap_buf_up() end },
        { '<leader><leader>l', function() require('smart-splits').swap_buf_right() end },
    },
    opts = {}
}
