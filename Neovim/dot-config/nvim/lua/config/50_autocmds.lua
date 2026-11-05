local function augroup(name)
    return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end
