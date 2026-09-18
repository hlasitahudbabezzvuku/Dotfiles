return {
    'stevearc/conform.nvim',
    event = 'BufRead',
    keys = {
        { 'grf', function() require('conform').format() end, desc = 'conform.format()' },
    },
    opts = {
        default_format_opts = {
            lsp_format = 'fallback',
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    },
}
