return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = {
        theme = 'doom',
        config = {
            header = {
                '   __ ____         _ __       __ __        ____        ___        ____           __       ',
                '  / // / /__ ____ (_) /____ _/ // /_ _____/ / /  ___ _/ _ )___ __/_  /_  ____ __/ /____ __',
                ' / _  / / _ `(_-</ / __/ _ `/ _  / // / _  / _ \\/ _ `/ _  / -_)_ // /| |/ / // /  \'_/ // /',
                '/_//_/_/\\_,_/___/_/\\__/\\_,_/_//_/\\_,_/\\_,_/_.__/\\_,_/____/\\__//__/___/___/\\_,_/_/\\_\\\\_,_/ ',
                '', '', ''
            },
            center = {
                {
                    icon = '  ',
                    icon_hl = 'Keyword',
                    desc = 'Find File        ',
                    key = 'f',
                    key_hl = 'Comment',
                    key_format = ' [%s]',
                    action = 'Telescope find_files'
                },
                {
                    icon = '  ',
                    icon_hl = 'Keyword',
                    desc = 'Grep File',
                    key = 'g',
                    key_hl = 'Comment',
                    key_format = ' [%s]',
                    action = 'Telescope live_grep'
                },
                {
                    icon = '  ',
                    icon_hl = 'Keyword',
                    desc = 'Commands',
                    key = ';',
                    key_hl = 'Comment',
                    key_format = ' [%s]',
                    action = 'Telescope builtin'
                },
                {
                    icon = '  ',
                    icon_hl = 'Keyword',
                    desc = 'Quit',
                    key = 'q',
                    key_hl = 'Comment',
                    key_format = ' [%s]',
                    action = 'quit'
                },
            },
            footer = {
                '', '',
                'There are only two hard things in Computer Science: cache invalidation and naming things.'
            },
            vertical_center = true
        }
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
