-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear search highlighting on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Fix indentation when moving lines in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected test down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected test up' })

-- Append line below to current line without moving the cursor
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Append the line below to the current line with a space' })

-- Keep the cursor centered when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste over selection without replacing copy register
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste over selection without replacing copy register' })
-- Delete without replacing copy register
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without replacing copy register' })

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank until end of line to system clipboard' })

-- Make ctrl-c the same as escape in the one place it isn't
vim.keymap.set('i', '<C-c>', '<Esc>')

-- increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit window [V]ertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit window [H]orizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make [S]plits [E]qual size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current [S]plit [x]' })
