local M = {}

function M.setup()
    local root = require('modules.utils').get_root()

    if root then
        vim.api.nvim_set_current_dir(root)
    else
        vim.api.nvim_set_current_dir(vim.fn.getcwd())
    end

    vim.notify('Neovim root set to ' .. vim.fn.getcwd(), vim.log.levels.INFO)
end

return M
