local function augroup(name)
    return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup('highlight_yank'),
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
    group = augroup('resize_splits'),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd('tabdo wincmd =')
        vim.cmd('tabnext ' .. current_tab)
    end,
})

-- Wrap in text filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('wrap'),
    pattern = {
        'text',
        'plaintex',
        'gitcommit',
        'markdown',
    },
    callback = function()
        vim.opt_local.wrap = true
    end,
})
