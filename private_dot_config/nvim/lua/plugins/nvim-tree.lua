return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    view = {
      width = 35,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        git_placement = 'after',
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    -- disable window_picker for explorer to work well with window splits
    actions = {
      open_file = {
        -- quit_on_open = true
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      custom = { '^\\.git$' },
    },
  },
  keys = {
    { '<leader>ec', '<cmd>NvimTreeCollapse<CR>', desc = 'File [E]xplorer [C]ollaspe' },
    { '<leader>ef', '<cmd>NvimTreeFocus<CR>', desc = 'File [E]xplorer [F]ocus' },
    { '<leader>eF', '<cmd>NvimTreeFindFile<CR>', desc = 'File [E]xplorer on current [F]ile' },
    { '<leader>er', '<cmd>NvimTreeRefresh<CR>', desc = 'File [E]xplorer [R]efresh' },
    { '<leader>ex', '<cmd>NvimTreeClose<CR>', desc = 'File [E]xplorer e[X]it' },
  },
}
