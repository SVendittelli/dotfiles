-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--  Automatically apply changes on files under chezmoi source path
--  e.g. ~/.local/share/chezmoi/*
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { os.getenv 'HOME' .. '/.local/share/chezmoi/*' },
  group = vim.api.nvim_create_augroup('chezmoi-edit-group', { clear = true }),
  callback = function()
    vim.schedule(require('chezmoi.commands.__edit').watch)
  end,
})
