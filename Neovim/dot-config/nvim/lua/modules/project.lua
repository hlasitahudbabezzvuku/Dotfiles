local M = {}

local function get_all_adapters()
    local set = {}

    for k in pairs(require('dap').adapters) do set[k] = true end

    local ok, mason = pcall(require, 'mason-nvim-dap')
    if ok then
        for _, k in ipairs(mason.get_installed_sources()) do set[k] = true end
    end

    local list = vim.tbl_keys(set)
    table.sort(list)

    return #list > 0 and list or { 'codelldb', 'gdb' }
end

function M.configure()
    if vim.uv.fs_stat('.nvim.lua') then
        return true
    end

    if vim.fn.confirm('No .nvim.lua found. Generate one?', '&Yes\n&No', 2) ~= 1 then
        return false
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
        adapter(get_all_adapters()),
        exec_path
    )

    vim.fn.writefile(vim.split(content, '\n'), '.nvim.lua')
    dofile('.nvim.lua')
    vim.notify('.nvim.lua created and loaded', vim.log.levels.INFO)

    return true
end

return M
