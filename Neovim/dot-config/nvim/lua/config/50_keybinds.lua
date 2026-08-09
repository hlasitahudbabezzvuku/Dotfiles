-- Files
vim.keymap.set('n', '<leader>e', '<cmd>Explore<cr>', { noremap = true, silent = true, desc = 'Open netrw' })

-- Directories
vim.keymap.set('n', '<leader>cc', function() vim.cmd('cd ' .. vim.fn.expand('%:p:h')) end,
    { noremap = true, silent = true, desc = 'Change root to this file' })
vim.keymap.set('n', '<leader>cu', function() vim.cmd('cd ' .. vim.fn.expand('..')) end,
    { noremap = true, silent = true, desc = 'Change root to one directory up' })

-- QoL
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- Disable arrows
vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<up>', '<nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<down>', '<nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<left>', '<nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<right>', '<nop>', { noremap = true, silent = true })

-- Enable navigation using c-a-<direction>
vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<c-a-k>', '<up>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<c-a-j>', '<down>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<c-a-h>', '<left>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<c-a-l>', '<right>', { noremap = true, silent = true })
