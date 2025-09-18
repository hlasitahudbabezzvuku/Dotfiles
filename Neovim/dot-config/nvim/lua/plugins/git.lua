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
        },
    },
    {
        'sindrets/diffview.nvim',
        event = 'BufRead',
        opts = {}
    }
}
