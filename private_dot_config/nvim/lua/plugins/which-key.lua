-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  init = function()
    -- Decrease mapped sequence wait time
    -- Displays which-key popup sooner
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup({
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    })

    -- Document existing key chains
    require('which-key').add({
      { '<leader>c', group = '[c]ode' },
      { '<leader>d', group = '[d]ocument' },
      { '<leader>e', group = 'file [e]xplorer' },
      { '<leader>f', group = '[f]ind' },
      { '<leader>g', group = '[g]it hunk', mode = { 'n', 'v' } },
      { '<leader>h', group = '[h]arpoon' },
      { '<leader>r', group = '[r]ename' },
      { '<leader>s', group = '[s]plit' },
      { '<leader>t', group = '[t]oggle' },
      { '<leader>w', group = '[w]orkspace' },
    })
  end,
}
