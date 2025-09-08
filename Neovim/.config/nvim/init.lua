--    _  __             _     
--   / |/ /__ ___ _  __(_)_ _ 
--  /    / -_) _ \ |/ / /  ' \
-- /_/|_/\__/\___/___/_/_/_/_/


require('config.options')
require('config.keybinds')

require('config.lazy')

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function ()
        local current_root = vim.fn.fnamemodify(vim.fn.expand('%:p'), ':h')
        local git_root = vim.fs.root(current_root, { '.git' }, 20)

        if git_root then
            vim.api.nvim_set_current_dir(git_root)
        else
            vim.api.nvim_set_current_dir(current_root)
        end

        vim.notify('Neovim root set to ' .. current_root, vim.log.levels.INFO)
    end
})

