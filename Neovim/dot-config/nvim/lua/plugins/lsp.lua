return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'mason.nvim',
        'mason-org/mason-lspconfig.nvim',
    },
    keys = {
        {'<f2>', vim.lsp.buf.rename, mode = { 'n', 'i', 'x' }},
        {'<f3>', vim.lsp.buf.code_action, mode = { 'n', 'i', 'x' }},
        {'<f4>', vim.lsp.buf.format, mode = { 'n', 'i', 'x' }},
        {'gd', vim.lsp.buf.definition},
        {'gD', vim.lsp.buf.declaration},
        {'gi', vim.lsp.buf.implementation},
        {'go', vim.lsp.buf.type_definition},
        {'gr', vim.lsp.buf.references},
        {'gs', vim.lsp.buf.signature_help},
    },
    config = function ()
        vim.diagnostic.config({
            virtual_text = { prefix = ' ' },
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

