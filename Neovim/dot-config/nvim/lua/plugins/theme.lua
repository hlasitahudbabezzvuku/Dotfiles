return {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('github-theme').setup({
            options = {
                transparent = true,
                styles = {
                    comments = 'italic',
                    keywords = 'bold',
                    types = 'italic,bold',
                }
            },
            groups = {
                all = {
                    TelescopeBorder                = { fg = 'bg3' },
                    TelescopePromptTitle           = { bg = 'palette.blue', fg = 'bg0' },
                    TelescopePreviewTitle          = { bg = 'palette.blue', fg = 'bg0' },
                    TelescopeSelection             = { bg = 'sel0' },

                    NoiceCmdlinePopupBorderCmdline = { fg = 'bg3' },
                    NoiceCmdlinePopupBorderHelp    = { fg = 'bg3' },
                    NoiceCmdlinePopupBorderLua     = { fg = 'bg3' },
                    NoiceCmdlinePopupBorderSearch  = { fg = 'bg3' },

                    NoiceCmdlinePopupTitleCmdline  = { bg = 'palette.red', fg = 'bg0' },
                    NoiceCmdlinePopupTitleHelp     = { bg = 'palette.blue', fg = 'bg0' },
                    NoiceCmdlinePopupTitleLua      = { bg = 'palette.blue', fg = 'bg0' },
                    NoiceCmdlinePopupTitleSearch   = { bg = 'palette.orange', fg = 'bg0' },

                    NoiceCmdlineIcon               = { fg = 'palette.blue' },
                    NoiceCmdlineIconCmdline        = { fg = 'palette.red' },
                    NoiceCmdlineIconSearch         = { fg = 'palette.orange' },

                    NotifyERRORBorder              = { fg = 'bg3' },
                    NotifyWARNBorder               = { fg = 'bg3' },
                    NotifyINFOBorder               = { fg = 'bg3' },
                    NotifyDEBUGBorder              = { fg = 'bg3' },
                    NotifyTRACEBorder              = { fg = 'bg3' },

                    NotifyERRORIcon                = { fg = 'palette.red' },
                    NotifyWARNIcon                 = { fg = 'palette.yellow' },
                    NotifyINFOIcon                 = { fg = 'palette.blue' },
                    NotifyDEBUGIcon                = { fg = 'palette.green' },
                    NotifyTRACEIcon                = { fg = 'palette.orange' },

                    NotifyERRORTitle               = { fg = 'palette.red' },
                    NotifyWARNTitle                = { fg = 'palette.yellow' },
                    NotifyINFOTitle                = { fg = 'palette.blue' },
                    NotifyDEBUGTitle               = { fg = 'palette.green' },
                    NotifyTRACETitle               = { fg = 'palette.orange' },

                    NotifyERRORBody                = { fg = 'fg1' },
                    NotifyWARNBody                 = { fg = 'fg1' },
                    NotifyINFOBody                 = { fg = 'fg1' },
                    NotifyDEBUGBody                = { fg = 'fg1' },
                    NotifyTRACEBody                = { fg = 'fg1' },

                    WhichKeyTitle                  = { bg = 'palette.red', fg = 'bg0' },
                    WhichKeyDesc                   = { fg = 'fg2' },
                    WhichKeySeparator              = { fg = 'bg3' },
                    WhichKeyBorder                 = { fg = 'bg3' },
                },
            },
        })
        vim.cmd('colorscheme github_dark_default')
    end,
}
