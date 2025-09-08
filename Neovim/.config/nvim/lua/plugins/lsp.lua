return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set({ 'n', 'i', 'x' }, '<a-cr>', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set({ 'n', 'i', 'x' }, '<f2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'i', 'x' }, '<f3>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                vim.keymap.set({ 'n', 'i', 'x' }, '<f4>', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            end,
        })

        vim.diagnostic.config({
            virtual_text = { prefix = ' ' },
            underline = true,
            update_in_insert = true,
            severity_sort = false,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.INFO] = '',
                    [vim.diagnostic.severity.HINT] = '',
                },
            },
        })

        local border = {
            { '╭', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '╮', 'FloatBorder' },
            { '│', 'FloatBorder' },
            { '╯', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '╰', 'FloatBorder' },
            { '│', 'FloatBorder' },
        }

        local preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            return preview(contents, syntax, opts, ...)
        end
    end
}

