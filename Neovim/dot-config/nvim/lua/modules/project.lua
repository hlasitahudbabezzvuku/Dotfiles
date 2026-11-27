--- Interactive wizard for per-project launch/debug configuration.
---
--- Guides the user through a questionnaire and writes the result as a
--- `.nvim.lua` file in the current working directory, then executes it so the
--- DAP and Overseer configuration takes effect immediately. Running the
--- wizard twice simply re-executes the existing file.
local M = {}

--- Wrap a string in single quotes so it can be embedded in generated Lua source.
---@param str string
---@return string
local function quote(str)
    return '\'' .. str .. '\''
end

--- Prompt the user for free-form input. Synchronous wrapper around
--- `vim.ui.input` for use inside a coroutine.
---@param opts table Options passed straight through to `vim.ui.input`.
---@return string? result The entered text, or nil when aborted.
local function input(opts)
    local c = coroutine.running()

    vim.schedule(function()
        vim.ui.input(opts, function(result)
            coroutine.resume(c, result)
        end)
    end)

    return coroutine.yield()
end

--- Prompt the user to pick from a list. Synchronous wrapper around
--- `vim.ui.select` for use inside a coroutine.
---@param items any[] Options passed straight through to `vim.ui.select`.
---@param opts table
---@return any? item The selected item, or nil when aborted.
---@return integer? index The 1-based index of the selected item.
local function select(items, opts)
    local c = coroutine.running()

    vim.schedule(function()
        vim.ui.select(items, opts, function(item, idx)
            coroutine.resume(c, item, idx)
        end)
    end)

    return coroutine.yield()
end

--- Read a template file from this config's `lua/templates/` directory.
---@param name string Template name, without the `.lua` extension.
---@return string
local function template(name)
    return vim.fn.readblob(vim.fn.stdpath('config') .. '/lua/templates/' .. name .. '.lua')
end

--- Render the final `.nvim.lua` contents from the collected `config` fields.
---@param config table Collected wizard answers (name, lang, adapter,
---   executable, and an optional task with name/command/is_template).
---@return string contents The rendered Lua source.
local function format(config)
    local str_config = ''
    local str_task = ''
    local str_prelaunch = ''

    if config.task then
        if config.task.is_template == false then
            -- Split off the command's first word (the binary) from its
            -- arguments, so each part can be quoted individually.
            local parts = vim.split(config.task.command, '%s+', { trimempty = true })
            str_task = string.format(
                template('task'),
                quote(config.task.name),
                quote(table.remove(parts, 1)),
                table.concat(vim.tbl_map(quote, parts), ', '))
        end
        str_prelaunch = string.format(template('prelaunch'), quote(config.task.name))
    end

    str_config = string.format(
        template('config'),
        config.lang,
        quote(config.name),
        quote(config.adapter),
        quote(config.executable),
        str_prelaunch)

    return string.format(template('default'), str_config, str_task)
end

--- Run the wizard (or re-execute the existing configuration) and finish with
--- `callback`.
---
--- Must be called from the main loop: it drives the questionnaire inside a
--- coroutine that suspends on every prompt.
---@param adapters string[] Available DAP adapter names.
---@param tasks string[] Available Overseer template names.
---@param callback fun() Invoked once the configuration has been applied.
function M.configure(adapters, tasks, callback)
    local file = vim.fn.getcwd() .. '/.nvim.lua'

    if vim.uv.fs_stat(file) then
        callback()
        return
    end

    local config = {
        name = nil,
        lang = vim.bo.filetype,
        adapter = nil,
        executable = nil,
        task = {
            is_template = nil,
            name = nil,
            command = nil,
        }
    }

    coroutine.wrap(function()
        -- Gate: only continue when the user actually wants a new file.
        if select({ 'Yes', 'No' }, { prompt = 'Create new project configuration?' }) ~= 'Yes' then
            if select({ 'Yes', 'No' }, { prompt = 'Run with default adapter configuration?' }) == 'Yes' then
                callback()
            end
            return
        end

        -- Step: general configuration.
        config.name = input({ prompt = 'Configuration name: ', default = 'Launch' })
        if not config.name or config.name == '' then return end

        config.lang = input({ prompt = 'Language: ', default = config.lang })
        if not config.lang or config.lang == '' then return end

        -- Step: pick (or name) the DAP adapter.
        if #adapters == 0 then
            config.adapter = input({ prompt = 'No DAP adapters found. Enter adapter name manually: ' })
            if not config.adapter or config.adapter == '' then return end
        else
            config.adapter = select(adapters, { prompt = 'Select DAP adapter: ' })
            if not config.adapter or config.adapter == '' then return end
        end

        -- Step: target executable.
        config.executable = input({ prompt = 'Path to executable: ', default = '${workspaceFolder}/', completion = 'file' })
        if not config.executable or config.executable == '' then return end

        -- Step: optional pre-launch task.
        if select({ 'Yes', 'No' }, { prompt = 'Use pre-launch task?' }) == 'Yes' then
            if select({ 'Template', 'Custom' }, { prompt = 'Use Overseer template or create custom one?' }) == 'Template' then
                config.task.name = select(tasks, { prompt = 'Template: ' })
                if not config.task.name or config.task.name == '' then return end

                config.task.is_template = true
            else
                config.task.name = input({ prompt = 'Name: ', default = 'Build' })
                if not config.task.name or config.task.name == '' then return end
                config.task.command = input({ prompt = 'Command: ', default = 'make' })
                if not config.task.command or config.task.command == '' then return end

                config.task.is_template = false
            end
        else
            config.task = nil
        end

        -- Step: persist and apply.
        vim.fn.writefile(format(config), file)
        dofile(file)
        callback()
    end)()
end

return M
