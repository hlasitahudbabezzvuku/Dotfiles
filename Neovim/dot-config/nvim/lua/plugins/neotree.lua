return {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
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
