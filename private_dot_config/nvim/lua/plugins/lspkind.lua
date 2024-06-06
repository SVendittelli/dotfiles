return {
  'onsails/lspkind-nvim',
  event = 'InsertEnter',
  config = function()
    require('lspkind').init({
      symbol_map = {
        Supermaven = '',
      },
    })

    vim.api.nvim_set_hl(0, 'CmpItemKindSupermaven', { fg = '#9ece6a' })
  end,
}
