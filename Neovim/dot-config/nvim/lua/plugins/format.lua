return {
    'stevearc/conform.nvim',
    event = 'BufRead',
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    },
}
