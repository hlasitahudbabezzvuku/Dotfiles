--    _  __             _
--   / |/ /__ ___ _  __(_)_ _
--  /    / -_) _ \ |/ / /  ' \
-- /_/|_/\__/\___/___/_/_/_/_/


require('config.options')
require('config.keybinds')

require('config.lazy')

vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
        for _, file in ipairs(vim.api.nvim_get_runtime_file('lua/modules/*.lua', true)) do
            local ok, module = pcall(require, 'modules.' .. vim.fn.fnamemodify(file, ':t:r'))
            if ok and type(module) == 'table' and module.setup then
                module.setup()
            end
        end
    end,
})
