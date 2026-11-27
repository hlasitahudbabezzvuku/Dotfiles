return {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local function tabs()
            local current = vim.fn.tabpagenr()
            local last = vim.fn.tabpagenr('$')
            local parts = {}

            for i = 1, last do
                if i == current then
                    table.insert(parts, '[' .. i .. ']')
                else
                    table.insert(parts, ' ' .. i .. ' ')
                end
            end

            return table.concat(parts, '  ')
        end

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
                disabled_filetypes = { 'dashboard' },
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        separator = { left = '', right = '' }
                    }
                },
                lualine_b = {
                    {
                        tabs,
                        padding = { left = 3, right = 1 },
                    },
                    { 'branch' },
                    { 'diff' },
                    { 'diagnostics' },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {
                    {
                        require('noice').api.status.mode.get,
                        cond = require('noice').api.status.mode.has,
                        color = { fg = '#797ef9' },
                    },
                    { 'searchcount' },
                    { 'selectioncount' },
                    { 'progress' },
                    { 'encoding' },
                    {
                        'filetype',
                        icon_only = true,
                        padding = { left = 1, right = 0 },
                    },
                    {
                        'filename',
                        padding = { left = 0, right = 3 },
                        separator = { left = '?', right = nil },
                    },
                },
                lualine_z = {
                    {
                        'location',
                        padding = 2,
                        separator = { left = '', right = '' }
                    },
                },
            },
        })
    end
}
