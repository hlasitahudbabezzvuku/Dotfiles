return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                section_separators = '',
                component_separators = '',
                globalstatus = false,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    {
                        'tabs',
                        tab_max_length = 20,
                        mode = 1,
                        path = 0,
                        use_mode_colors = true,
                    }
                },
                lualine_c = { 'diagnostics' },
                lualine_x = { 'branch', 'diff' },
                lualine_y = {},
                lualine_z = { 'fileformat' }
            }
        })
    end
}
