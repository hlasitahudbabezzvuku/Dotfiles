return {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install({
            'lua',
            'bash',
            'vim',
            'vimdoc',
            'regex',
            'markdown',
            'markdown_inline'
        })
        vim.treesitter.auto_install = false
        vim.treesitter.highlight = { enable = true }
    end
}
