--- Centralised manager for plugin-owned window layouts (nvim-dap-ui, overseer, ...).
---
--- Each plugin registers a layout: a pair of functions that open and close all
--- of its windows. Opening one layout automatically closes the previous one,
--- so plugins no longer need to know about each other.
local M = {}

---@class Layout
---@field open fun() Opens all windows of the layout.
---@field close fun() Closes all windows of the layout.
---@field is_open? fun(): boolean Optional: reports whether the windows are
---   actually open. Used to re-sync state after the user closes a window
---   manually (e.g. `:q` on the dap-ui window).

--- All registered layouts, keyed by name.
local layouts = {}

--- Name of the currently open layout, or nil when none is open.
local current = nil

--- Register a layout under `name`. Redefining a name replaces the old entry.
---@param name string
---@param layout Layout
function M.register(name, layout)
    layouts[name] = layout
end

--- Close the currently open layout. No-op when none is open.
function M.close()
    if not current then return end

    local layout = layouts[current]
    if layout then layout.close() end
    current = nil
end

--- Close the current layout, then open `name`.
---@param name string
function M.open(name)
    local layout = layouts[name]
    if not layout then
        vim.notify('Unknown layout: ' .. name, vim.log.levels.WARN)
        return
    end

    M.close()
    layout.open()
    current = name
end

--- Toggle `name`: closes it when it is the open layout, opens it otherwise.
---@param name string
function M.toggle(name)
    local layout = layouts[name]
    if not layout then
        vim.notify('Unknown layout: ' .. name, vim.log.levels.WARN)
        return
    end

    local is_open = layout.is_open and layout.is_open() or current == name
    if current == name and is_open then
        M.close()
    else
        M.open(name)
    end
end

--- Whether `name` is the currently open layout.
---@param name string?
function M.is_current(name)
    return current ~= nil and current == name
end

return M
