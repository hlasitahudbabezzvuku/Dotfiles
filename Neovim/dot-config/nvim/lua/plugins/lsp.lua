return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = { 'rachartier/tiny-inline-diagnostic.nvim' },
        keys = { { 'grl', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = 'conform.format()' } },
        config = function()
            vim.lsp.enable({ 'clangd', 'shellcheck' })
        end
    },
    {
        'rachartier/tiny-inline-diagnostic.nvim',
        opts = {
            options = {
                multilines = {
                    enabled = true,
                    always_show = true,
                }
            },
        },
    },
}
