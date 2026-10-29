local M = {}

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
    callback()
end

return M
