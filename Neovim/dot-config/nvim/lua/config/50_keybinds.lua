-- Files
vim.keymap.set('n', '<leader>e', function() vim.cmd('Explore') end,
    { noremap = true, silent = true, desc = 'Open netrw' })

-- Directories
vim.keymap.set('n', '<leader>cc', function() vim.cmd('cd ' .. vim.fn.expand('%:p:h')) end,
    { noremap = true, silent = true, desc = 'Change root to this file' })
vim.keymap.set('n', '<leader>cu', function() vim.cmd('cd ' .. vim.fn.expand('..')) end,
    { noremap = true, silent = true, desc = 'Change root to one directory up' })

-- QoL
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- Tab switching
vim.keymap.set('n', '<tab>', function() vim.cmd('tabnext') end, { desc = 'Next buffer' })
vim.keymap.set('n', '<s-tab>', function() vim.cmd('tabprevious') end, { desc = 'Previous buffer' })
