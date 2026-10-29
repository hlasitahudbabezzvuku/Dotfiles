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

        config.executable = input({ prompt = 'Path to executable: ', default = '${workspaceFolder}/' })
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
    end)()
end

return M
