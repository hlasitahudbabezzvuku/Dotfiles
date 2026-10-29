local M = {}

local function quote(str)
    return '\'' .. str .. '\''
end

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

local function format(config)
    local tmpl_default = vim.fn.readblob(vim.fn.stdpath('config') .. '/lua/templates/default.lua')
    local tmpl_config = vim.fn.readblob(vim.fn.stdpath('config') .. '/lua/templates/config.lua')
    local tmpl_task = vim.fn.readblob(vim.fn.stdpath('config') .. '/lua/templates/task.lua')
    local tmpl_prelaunch = vim.fn.readblob(vim.fn.stdpath('config') .. '/lua/templates/prelaunch.lua')

    local str_config = ''
    local str_task = ''
    local str_prelaunch = ''

    if config.task then
        if config.task.is_template == false then
            local parts = vim.split(config.task.command, '%s+', { trimempty = true })
            str_task = string.format(
                tmpl_task,
                quote(config.task.name),
                quote(table.remove(parts, 1)),
                table.concat(vim.tbl_map(quote, parts), ', '))
        end
        str_prelaunch = string.format(tmpl_prelaunch, quote(config.task.name))
    end

    str_config = string.format(
        tmpl_config,
        config.lang,
        quote(config.name),
        quote(config.adapter),
        quote(config.executable),
        str_prelaunch)

    return string.format(tmpl_default, str_config, str_task)
end

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
        if select({ 'Yes', 'No' }, { prompt = 'Create new project configuration?' }) ~= 'Yes' then
            if select({ 'Yes', 'No' }, { prompt = 'Run with default adapter configuration?' }) == 'Yes' then
                callback()
            end
            return
        end

        config.name = input({ prompt = 'Configuration name: ', default = 'Launch' })
        if not config.name or config.name == '' then return end

        config.lang = input({ prompt = 'Language: ', default = config.lang })
        if not config.lang or config.lang == '' then return end

        if #adapters == 0 then
            config.adapter = input({ prompt = 'No DAP adapters found. Enter adapter name manually: ' })
            if not config.adapter or config.adapter == '' then return end
        else
            config.adapter = select(adapters, { prompt = 'Select DAP adapter: ' })
            if not config.adapter or config.adapter == '' then return end
        end

        config.executable = input({ prompt = 'Path to executable: ', default = '${workspaceFolder}/', completion = 'file' })
        if not config.executable or config.executable == '' then return end

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

        vim.fn.writefile(format(config), file)
        dofile(file)
        callback()
    end)()
end

return M
