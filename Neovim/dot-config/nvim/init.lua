--    _  __             _
--   / |/ /__ ___ _  __(_)_ _
--  /    / -_) _ \ |/ / /  ' \
-- /_/|_/\__/\___/___/_/_/_/_/


for _, file in ipairs(vim.api.nvim_get_runtime_file('lua/config/*.lua', true)) do
    local mod_name = vim.fn.fnamemodify(file, ':t:r')
    require('config.' .. mod_name)
end
