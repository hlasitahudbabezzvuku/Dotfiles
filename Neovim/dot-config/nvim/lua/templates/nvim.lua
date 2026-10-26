local overseer = require('overseer')
local dap = require('dap')

-- 1. Task to compile project
overseer.register_template({
    name = 'Build',
    builder = function()
        return {
            cmd = { %s },
            args = { %s },
            components = { 'default', 'on_complete_dispose' }
        }
    end,
    condition = { dir = vim.fn.getcwd() }
})

-- 2. Debugger configuration
dap.configurations.%s = {
    {
        name = 'Debug',
        type = '%s',
        request = 'launch',
        program = '%s',
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        preLaunchTask = 'Build',
    }
}
