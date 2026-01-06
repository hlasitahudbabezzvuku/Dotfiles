local M = {}

function M.get_root()
    local markers = { '.git', 'Makefile', 'CMakeLists.txt', 'compile_commands.json' }
    return vim.fs.root(0, markers) or vim.fn.getcwd()
end

return M
