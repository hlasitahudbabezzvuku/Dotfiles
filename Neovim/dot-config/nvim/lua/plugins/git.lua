return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                delay = 750,
                ignore_whitespace = true,
            },
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "│" },
                untracked = { text = "│" },
            },
            signs_staged = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "│" },
            },
        },
    },
    {
        'sindrets/diffview.nvim',
        event = 'BufRead',
        opts = {}
    }
}
