local M = {}

function M.configure(adapters)
    if vim.uv.fs_stat('.nvim.lua') then
        return true
    end

    if vim.fn.confirm('No .nvim.lua found. Generate one?', '&Yes\n&No', 2) ~= 1 then
        if vim.fn.confirm('Use default configuration?', '&Yes\n&No', 2) ~= 1 then
            return true
        else
            return false
        end
    end

    local lang = vim.fn.input('Language: ', vim.bo.filetype ~= '' and vim.bo.filetype or 'c')
    if not lang then return false end

    local adapter = function(list)
        if #list == 1 then return list[1] end
        local menu = { 'Adapter: ' }

        for i, name in ipairs(list) do
            table.insert(menu, string.format('%d. %s', i, name))
        end

        return list[vim.fn.inputlist(menu)]
    end
    if not adapter then return false end

    local build_cmd = vim.fn.input('Build command: ')
    if not build_cmd then return false end

    local exec_path = vim.fn.input('Executable path: ', '${workspaceFolder}/', 'file')
    if not exec_path then return false end

    local ok, template = pcall(vim.fn.readfile, vim.fs.joinpath(vim.fn.stdpath('config'), 'lua', 'templates', 'nvim.lua'))
    if not ok then
        vim.notify('Template not found', vim.log.levels.ERROR)
        return false
    end

    local parts = vim.split(build_cmd, '%s+', { trimempty = true })
    local cmd = string.format('%q', parts[1] or '')
    local args = vim.iter(parts):skip(1):map(function(v) return string.format('%q', v) end):join(', ')

    local content = string.format(
        table.concat(template, '\n'),
        cmd,
        args,
        lang,
        adapter(adapters),
        exec_path
    )

    vim.fn.writefile(vim.split(content, '\n'), '.nvim.lua')
    dofile('.nvim.lua')
    vim.notify('.nvim.lua created and loaded', vim.log.levels.INFO)

    return true
end

return M
