-- TODO: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#git-pickers

return {
    {
        'nvim-telescope/telescope.nvim',
        dependecies = { 'nvim-tree/nvim-web-devicons' },
        cmd = 'Telescope',
        keys = {
            { '<leader>f', function() require('telescope.builtin').find_files() end,            desc = 'Find files' },
            { '<leader>g', function() require('telescope.builtin').live_grep() end,             desc = 'Live grep' },
            { '<leader>b', function() require('telescope.builtin').buffers() end,               desc = 'Find buffers' },
            { '<leader>k', function() require('telescope.builtin').diagnostics() end,           desc = 'Find diagnostics' },
            { '<leader>;', function() require('telescope.builtin').builtin() end,               desc = 'Telescope' },
            { '<leader>j', function() require('telescope.builtin').lsp_document_symbols() end,  desc = 'LSP document symbols' },
            { '<leader>h', function() require('telescope.builtin').lsp_workspace_symbols() end, desc = 'LSP workspace symbols' },
        },
        opts = {
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                        width = { padding = 0 },
                        height = { padding = 0 },
                        preview_width = 0.5,
                    },
                },
                sorting_strategy = 'ascending',
                path_display = { 'filename_first' }
            },
            extensions = {
                ['ui-select'] = { require('telescope.themes').get_dropdown {} }
            }
        }
    },
    {
        'LukasPietzschmann/telescope-tabs',
        keys = {
            { '<leader>t', function() require('telescope-tabs').list_tabs() end, desc = 'Find tabs' },
        },
        config = function()
            require('telescope').load_extension('telescope-tabs')
            require('telescope-tabs').setup {}
        end,
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        event = 'VeryLazy',
        config = function()
            require('telescope').load_extension('ui-select')
        end
    }
}
