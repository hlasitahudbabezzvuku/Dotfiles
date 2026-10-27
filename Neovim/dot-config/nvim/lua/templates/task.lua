overseer.register_template({
    name = '%s',
    builder = function()
        return {
            cmd = %s,
            args = %s,
            components = { 'default', 'on_complete_dispose' }
        }
    end,
    condition = { dir = vim.fn.getcwd() }
})
