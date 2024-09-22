vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

-- Alias write for when I fat finger shift when saving
vim.api.nvim_create_user_command('W', 'write', {
  desc = 'Write the whole buffer to the current file.',
})
vim.api.nvim_create_user_command('Wa', 'wall', {
  desc = 'Write all changed buffers.',
})
vim.api.nvim_create_user_command('Wqa', 'wqall', {
  desc = 'Write all changed buffers and exit Vim.',
})
