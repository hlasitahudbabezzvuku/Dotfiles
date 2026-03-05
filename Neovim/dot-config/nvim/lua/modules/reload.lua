local M = {}

function M.setup()
    vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
        callback = function()
            if vim.fn.mode() ~= 'c' then
                vim.cmd.checktime()
            end
        end,
    })
end

return M
