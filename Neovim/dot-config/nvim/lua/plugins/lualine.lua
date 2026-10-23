return {
    'nvim-lualine/lualine.nvim',
    event = 'BufRead',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local winbar_cfg = {
            lualine_b = {
                {
                    'filetype',
                    icon_only = true,
                    padding = { left = 1, right = 0 },
                    separator = { left = '', right = nil },
                },
                { 'filename' },
                { 'diagnostics' },
                { 'diff' },
            },
            lualine_y = {
                { 'encoding' },
                { 'progress' },
                {
                    'location',
                    padding = { left = 0, right = 1 },
                    separator = { left = nil, right = '' }
                },
            },
        }

        local sections_cfg = {
            lualine_a = {
                {
                    'mode',
                    separator = { left = '', right = '' }
                }
            },
            lualine_b = {
                {
                    'tabs',
                    padding = { left = 3, right = 1 },
                },
                { 'branch' },
                {
                    require('noice').api.status.mode.get,
                    cond = require('noice').api.status.mode.has,
                    color = { fg = '#797ef9' },
                },
                { 'searchcount' },
                { 'selectioncount' },
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {
                {
                    'windows',
                    mode = 2,
                    padding = { left = 1, right = 3 },
                }
            },
            lualine_z = {
                {
                    require('noice').api.status.command.get,
                    cond = require('noice').api.status.command.has,
                    padding = 3,
                    separator = { left = '', right = '' }
                },
            },
        }

        local theme = require('lualine.themes.auto')

        theme.normal = {
            a = { bg = '#f0f2f4', fg = 'Black' },
            b = { bg = 'Black', fg = '#f0f2f4' },
            c = { bg = 'Black', fg = '#f0f2f4' },
        }

        theme.insert = {
            a = { bg = '#7ee787', fg = 'Black' },
            b = { bg = 'Black', fg = '#f0f2f4' },
            c = { bg = 'Black', fg = '#f0f2f4' },
        }

        theme.visual = {
            a = { bg = '#ffa657', fg = 'Black' },
            b = { bg = 'Black', fg = '#f0f2f4' },
            c = { bg = 'Black', fg = '#f0f2f4' },
        }

        theme.replace = {
            a = { bg = '#797ef9', fg = 'Black' },
            b = { bg = 'Black', fg = '#f0f2f4' },
            c = { bg = 'Black', fg = '#f0f2f4' },
        }

        theme.command = {
            a = { bg = '#ff7b72', fg = 'Black' },
            b = { bg = 'Black', fg = '#f0f2f4' },
            c = { bg = 'Black', fg = '#f0f2f4' },
        }

        theme.inactive = {
            a = { bg = '#f0f2f4', fg = 'Black' },
            b = { bg = 'Black', fg = '#f0f2f4' },
            c = { bg = 'Black', fg = '#f0f2f4' },
        }

        require('lualine').setup({
            options = {
                theme = theme,
                icons_enabled = true,
                section_separators = { left = '', right = '' },
                component_separators = { left = '    ', right = '    ' },
                globalstatus = true,
            },
            sections = sections_cfg,
            winbar = winbar_cfg,
            inactive_winbar = winbar_cfg,
        })
    end
}
