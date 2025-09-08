-- Files
vim.keymap.set('n', '<leader>e', '<cmd>Explore<cr>', { noremap = true, silent = true })

vim.keymap.set({ 'n', 'i', 'x', 'v', 't' }, '<c-s>', '<cmd>write<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'x', 'v', 't' }, '<c-q>', '<cmd>quitall<cr>', { noremap = true, silent = true })

-- Directories
vim.keymap.set('n', '<leader>cc', function() vim.cmd('cd ' .. vim.fn.expand('%:p:h')) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cu', function() vim.cmd('cd ' .. vim.fn.expand('..')) end, { noremap = true, silent = true })

-- Buffers
vim.keymap.set('n', '<leader>d', '<cmd>bdelete<cr>', { noremap = true, silent = true })

-- Tabs
vim.keymap.set('n', '<leader>n', '<cmd>tabnext<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '<cmd>tabprevious<cr>', { noremap = true, silent = true })

-- QoL
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- Tools
vim.keymap.set('n', '<leader>ll', '<cmd>Lazy<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lm', '<cmd>Mason<cr>', { noremap = true, silent = true })

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

