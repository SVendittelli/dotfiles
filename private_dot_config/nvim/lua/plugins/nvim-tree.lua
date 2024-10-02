-- A File Explorer For Neovim Written In Lua
-- https://github.com/nvim-tree/nvim-tree.lua

local view_width_max = -1 -- Dynamic to start

-- toggle the width and redraw
local function toggle_width_adaptive()
  if view_width_max == -1 then
    -- If dynamic, switch to fixed
    view_width_max = 35
  else
    -- If fixed, switch to dynamic
    view_width_max = -1
  end

  require('nvim-tree.api').tree.reload()
end

-- get current view width
local function get_view_width_max()
  return view_width_max
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    view = {
      side = 'right',
      width = {
        min = 30,
        max = get_view_width_max,
      },
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
    actions = {
      open_file = {
        quit_on_open = true,
        -- disable window_picker for explorer to work well with window splits
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      git_ignored = false,
      custom = { '^\\.git$' },
    },
    filesystem_watchers = {
      ignore_dirs = {
        'node_modules',
      },
    },
  },
  keys = {
    { '<leader>ec', '<cmd>NvimTreeCollapse<CR>', desc = 'File [e]xplorer [c]ollaspe' },
    { '<leader>ef', '<cmd>NvimTreeFindFile<CR>', desc = 'File [e]xplorer on current [f]ile' },
    { '<leader>eF', '<cmd>NvimTreeFocus<CR>', desc = 'File [e]xplorer [F]ocus' },
    { '<leader>er', '<cmd>NvimTreeRefresh<CR>', desc = 'File [e]xplorer [r]efresh' },
    { '<leader>ew', toggle_width_adaptive, desc = 'File [e]xplorer toggle adaptive [w]idth' },
    { '<leader>ex', '<cmd>NvimTreeClose<CR>', desc = 'File [e]xplorer e[x]it' },
  },
}
