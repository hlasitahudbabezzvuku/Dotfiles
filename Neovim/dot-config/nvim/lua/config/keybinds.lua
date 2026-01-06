-- Files
vim.keymap.set('n', '<leader>e', '<cmd>Explore<cr>', { noremap = true, silent = true, desc = 'Open netrw' })

vim.keymap.set({ 'n', 'i', 'x', 'v', 't' }, '<c-s>', '<cmd>write<cr>', { noremap = true, silent = true, desc = 'Save the current buffer' })
vim.keymap.set({ 'n', 'i', 'x', 'v', 't' }, '<c-q>', '<cmd>quitall<cr>', { noremap = true, silent = true, desc = 'Quit the current buffer'  })

-- Directories
vim.keymap.set('n', '<leader>cc', function() vim.cmd('cd ' .. vim.fn.expand('%:p:h')) end, { noremap = true, silent = true, desc = 'Change root to this file'  })
vim.keymap.set('n', '<leader>cu', function() vim.cmd('cd ' .. vim.fn.expand('..')) end, { noremap = true, silent = true, desc = 'Change root to one directory up'  })

-- QoL
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- Tools
vim.keymap.set('n', '<leader>ll', '<cmd>Lazy<cr>', { noremap = true, silent = true, desc = 'Open Lazy' })
vim.keymap.set('n', '<leader>lm', '<cmd>Mason<cr>', { noremap = true, silent = true, desc = 'Open Mason' })

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

