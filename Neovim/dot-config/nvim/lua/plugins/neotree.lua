return {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        { '<leader>xe', '<cmd>Neotree show position=right filesystem<cr>', desc = 'Filesystem', },
        { '<leader>xg', '<cmd>Neotree show position=right git_status<cr>', desc = 'Git Status', },
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
            },
        },
    }

}
