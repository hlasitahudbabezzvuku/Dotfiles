return {
    'neovim/nvim-lspconfig',
    keys = {
        { 'grl', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = 'conform.format()' },
    },
    config = function()
        vim.lsp.enable({ 'clangd', 'lua_ls', 'shellcheck' })
    end
}
