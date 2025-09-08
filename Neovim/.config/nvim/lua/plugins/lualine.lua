return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local palette = require('lualine.themes.github_dark_default')

        palette.normal.c.bg = 'None'
        palette.insert.c.bg = 'None'
        palette.command.c.bg = 'None'
        palette.visual.c.bg = 'None'
        palette.replace.c.bg = 'None'
        palette.terminal.c.bg = 'None'
        palette.inactive.c.bg = 'None'

        require('lualine').setup({
            options = {
                icons_enabled = true,
                section_separators = '',
                component_separators = '',
                theme = palette,
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
