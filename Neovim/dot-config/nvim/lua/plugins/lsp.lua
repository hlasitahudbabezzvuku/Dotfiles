return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'mason.nvim',
        'mason-org/mason-lspconfig.nvim',
    },
    keys = {
        { '<f2>', vim.lsp.buf.rename,                                                                  mode = { 'n', 'i', 'x' } },
        { '<f3>', vim.lsp.buf.code_action,                                                             mode = { 'n', 'i', 'x' } },
        { '<f4>', vim.lsp.buf.format,                                                                  mode = { 'n', 'i', 'x' } },
        { 'gd',   function() require('telescope.builtin').lsp_definitions({ reuse_win = true }) end },
        { 'gr',   function() require('telescope.builtin').lsp_references({ reuse_win = true }) end },
        { 'gi',   function() require('telescope.builtin').lsp_incoming_calls({ reuse_win = true }) end },
        { 'go',   function() require('telescope.builtin').lsp_outgoing_calls({ reuse_win = true }) end },
        { 'gD',   vim.lsp.buf.declaration },
        { 'gs',   vim.lsp.buf.signature_help },
    },
    config = function()
        vim.diagnostic.config({
            virtual_lines = false,
            virtual_text = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.INFO] = '',
                    [vim.diagnostic.severity.HINT] = '',
                },
            },
        })
    end
}
