local M = {}

function M.configure()
    if vim.uv.fs_stat('.nvim.lua') then
        return true
    end

    if vim.fn.confirm('No .nvim.lua found. Generate one?', '&Yes\n&No', 2) ~= 1 then
        return false
    end

    local build_cmd = vim.fn.input('Build command: ')
    if build_cmd == '' then return false end

    local exec_path = vim.fn.input('Executable path: ', '${workspaceFolder}/', 'file')
    if exec_path == '' then return false end

    local ok, tmpl_lines = pcall(vim.fn.readfile, vim.fs.joinpath(vim.fn.stdpath('config'), 'templates', 'nvim.lua'))
    if not ok then
        return false
    end

    local parts = vim.split(build_cmd, '%s+', { trimempty = true })
    local cmd = string.format('%q', parts[1] or '')
    local args = vim.iter(parts):skip(1):map(function(v) return string.format('%q', v) end):join(', ')

    vim.fn.writefile(vim.split(string.format(table.concat(tmpl_lines, '\n'), cmd, args, exec_path), '\n'), '.nvim.lua')
    vim.notify('.nvim.lua created and loaded', vim.log.levels.INFO)

    dofile('.nvim.lua')
    return true
end

return M
