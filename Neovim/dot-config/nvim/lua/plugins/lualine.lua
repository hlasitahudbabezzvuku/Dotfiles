return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
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
            },
            sections = {},
            tabline = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = {
                    {
                        'diagnostics',
                        update_in_insert = false,
                    },
                    {
                        require('noice').api.statusline.mode.get,
                        cond = require('noice').api.statusline.mode.has,
                        color = { fg = '#7ee787' },
                    }
                },
                lualine_x = { 'diff' },
                lualine_y = { 'filetype', 'progress' },
                lualine_z = { 'fileformat' }
            }
        })

        vim.opt.laststatus = 0
    end
}
