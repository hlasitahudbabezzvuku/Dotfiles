return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local theme = require('lualine.themes.auto')

        theme.normal = {
            a = { bg = '#21262d', fg = '#c9d1d9' },
            b = { bg = '#161b22' },
            c = { bg = 'None', fg = '#c9d1d9' },
        }

        theme.insert = {
            a = { bg = '#7ee787', fg = 'Black' },
            b = { bg = '#161b22', fg = '#c9d1d9' },
            c = { bg = 'None', fg = '#c9d1d9' },
        }

        theme.visual = {
            a = { bg = '#ffa657', fg = 'Black' },
            b = { bg = '#161b22', fg = '#c9d1d9' },
            c = { bg = 'None', fg = '#c9d1d9' },
        }

        theme.replace = {
            a = { bg = '#797ef9', fg = 'Black' },
            b = { bg = '#161b22', fg = '#c9d1d9' },
            c = { bg = 'None', fg = '#c9d1d9' },
        }

        theme.command = {
            a = { bg = '#ff7b72', fg = 'Black' },
            b = { bg = '#161b22', fg = '#c9d1d9' },
            c = { bg = 'None', fg = '#c9d1d9' },
        }

        theme.inactive = {
            a = { bg = '#161b22', fg = '#c9d1d9' },
            b = { bg = '#161b22', fg = '#c9d1d9' },
            c = { bg = '#161b22', fg = '#c9d1d9' },
        }

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
