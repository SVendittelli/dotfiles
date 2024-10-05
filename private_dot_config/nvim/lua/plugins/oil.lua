local details = false

return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  config = function()
    require('oil').setup({
      default_file_explorer = false,
      keymaps = {
        ['<Esc>'] = 'actions.close',
        ['gd'] = {
          desc = 'Toggle file details view',
          callback = function()
            details = not details
            if details then
              require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
            else
              require('oil').set_columns({ 'icon' })
            end
          end,
        },
      },
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set('n', '<leader>o', require('oil').toggle_float, { desc = '[o]pen oil in a floating window' })
  end,
}
