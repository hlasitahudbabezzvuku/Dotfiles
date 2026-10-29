vim.g.autoformat = true

vim.api.nvim_create_user_command("FormatDisable", function(args) vim.g.autoformat = false end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function() vim.g.autoformat = true end, {
    desc = "Re-enable autoformat-on-save",
})

return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    keys = { { 'grf', function() require('conform').format() end, desc = 'conform.format()' } },
    opts = {
        default_format_opts = {
            lsp_format = 'fallback',
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = 'fallback',
        },
    },
}
