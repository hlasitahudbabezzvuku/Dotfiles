return {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    dependencies = {
        'saghen/blink.lib',
        'rafamadriz/friendly-snippets',
    },
    build = function()
        require('blink.cmp').build():pwait()
    end,
    opts = {
        keymap = { preset = 'enter' },
        sources = {
            default = {
                'snippets',
                'lsp',
                'path',
            }
        },
        completion = {
            menu = { border = 'rounded' },
            documentation = {
                window = { border = 'rounded' },
                auto_show = true,
            },
        },
        signature = { window = { border = 'rounded' } },
        fuzzy = { implementation = 'rust' },
        cmdline = {
            keymap = { ['<Tab>'] = { 'show', 'accept' }, },
            completion = { menu = { auto_show = true } },
        }
    },
}
