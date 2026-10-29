local M = {}

local function input(opts)
    local c = coroutine.running()

    vim.schedule(function()
        vim.ui.input(opts, function(r)
            coroutine.resume(c, r)
        end)
    end)

    return coroutine.yield()
end

local function select(items, opts)
    local c = coroutine.running()

    vim.schedule(function()
        vim.ui.select(items, opts, function(item, idx)
            vim.schedule(function()
                coroutine.resume(c, item, idx)
            end)
        end)
    end)

    return coroutine.yield()
end

function M.configure(adapters, tasks, callback)
    local file = vim.fn.getcwd() .. '/.nvim.lua'

    if vim.uv.fs_stat(file) then
        callback()
        return
    end

    coroutine.wrap(function()
        if select({ 'Yes', 'No' }, { prompt = 'Create new project configuration?' }) ~= 'Yes' then
            if select({ 'Yes', 'No' }, { prompt = 'Run with default adapter configuration?' }) == 'Yes' then
                callback()
            end
            return
        end
    end)()
end

return M
