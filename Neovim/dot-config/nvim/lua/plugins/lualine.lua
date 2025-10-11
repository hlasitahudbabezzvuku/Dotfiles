return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local theme = require('lualine.themes.auto')

        theme.normal.c.bg = 'none'
        theme.insert.c.bg = 'none'
        theme.visual.c.bg = 'none'
        theme.command.c.bg = 'none'
        theme.replace.c.bg = 'none'
        theme.terminal.c.bg = 'none'

        require('lualine').setup({
            options = {
                theme = theme,
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
