return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        {
            'L3MON4D3/LuaSnip',
            dependencies = {
                'saadparwaiz1/cmp_luasnip',
                'rafamadriz/friendly-snippets',
            }
        },
    },

    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup({
            view = {
                entries = 'custom'
            },

            sources = cmp.config.sources({
                { name = 'luasnip' },
                { name = 'nvim_lsp' },
                { name = 'render-markdown' },
                { name = 'path' },
                { name = 'buffer' },
                { name = 'nvim_lsp_signature_help' },
            }),

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = {
                ['<tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<s-tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<cr>'] = cmp.mapping.confirm({ select = false }),
                ['<c-x>'] = cmp.mapping.complete(),
            },

            experimental = {
                ghost_text = true,
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            require('luasnip.loaders.from_vscode').lazy_load()
        })
    end
}
