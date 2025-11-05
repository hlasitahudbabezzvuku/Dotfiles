return {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    build = ':TSUpdate',
    config = function ()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { 'lua', 'bash', 'vim', 'vimdoc', 'regex', 'markdown', 'markdown_inline' },
            auto_install = false,
            highlight = { enable = true },
        }
    end
}
