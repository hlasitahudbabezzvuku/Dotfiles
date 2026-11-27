--- Synchronous wrappers around Neovim's callback-based UI prompts.
---
--- `vim.ui.input` and `vim.ui.select` are asynchronous and callback-based,
--- which makes multi-step questionnaires awkward to write. These helpers
--- suspend the calling coroutine until the user answers, so a wizard can read
--- top-down like any other script.
---
--- Both functions must be called from inside a coroutine (e.g. wrap the
--- calling code with `coroutine.wrap`), otherwise they raise an error.
local M = {}

--- Whether the current context can yield, i.e. runs inside a coroutine.
--- Uses `coroutine.running()`'s second return value, since LuaJIT marks
--- `coroutine.isyieldable()` as deprecated.
local function is_yieldable()
    return select(2, coroutine.running()) == false
end

--- Prompt the user for free-form input and suspend until they answer.
---@param opts vim.ui.input.Opts? Options passed straight through to `vim.ui.input`.
---@return string? result The entered text, or nil when aborted.
function M.input(opts)
    assert(is_yieldable(), 'modules.ui: this function must be called from inside a coroutine')
    local c = coroutine.running()

    vim.schedule(function()
        vim.ui.input(opts, function(result)
            coroutine.resume(c, result)
        end)
    end)

    return coroutine.yield()
end

--- Prompt the user to pick from a list and suspend until they answer.
---@param items any[] Items passed straight through to `vim.ui.select`.
---@param opts vim.ui.select.Opts? Options passed straight through to `vim.ui.select`.
---@return any? item The selected item, or nil when aborted.
---@return integer? index The 1-based index of the selected item.
function M.select(items, opts)
    assert(is_yieldable(), 'modules.ui: this function must be called from inside a coroutine')
    local c = coroutine.running()

    vim.schedule(function()
        vim.ui.select(items, opts, function(item, idx)
            coroutine.resume(c, item, idx)
        end)
    end)

    return coroutine.yield()
end

return M
