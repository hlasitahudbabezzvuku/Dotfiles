return {
    'ThePrimeagen/refactoring.nvim',
    event = 'BufRead',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    keys = {
        { '<leader>r', function() require('refactoring').select_refactor() end, desc = 'Refactoring tools' },
    },
    opts = {},
}
