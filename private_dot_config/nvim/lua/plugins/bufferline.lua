return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'echasnovski/mini.nvim' },
  opts = {
    options = {
      close_command = function(n)
        require('mini.bufremove').delete(n, false)
      end,
      middle_mouse_command = function(n)
        require('mini.bufremove').delete(n, false)
      end,
      right_mouse_command = 'vertical sbuffer %d',
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          highlight = 'Directory',
          separator = true, -- use a "true" to enable the default, or set your own character
        },
      },
    },
  },
  -- TODO: add brackets around descriptions
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = '[B]uffer Toggle [P]in' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-[P]inned Buffers' },
    { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete [O]ther Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the [R]ight' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the [L]eft' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
}
