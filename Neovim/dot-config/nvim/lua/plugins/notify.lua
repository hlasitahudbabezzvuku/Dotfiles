return {
    'j-hui/fidget.nvim',
    lazy = false,
    config = function()
        require('fidget').setup({
            notification = {
                override_vim_notify = true,

                window = {
                    winblend = 0,
                    border = 'none',
                    x_padding = 2,
                    y_padding = 1,
                    align = 'bottom',
                },
            },
        })
    end
}
