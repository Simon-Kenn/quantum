local M = {}
local components = require('quantum.modules.ui.statusline.utils').components

function M.setup()
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { components.mode },
      lualine_b = { components.branch },
      --lualine_c = { 'diff', 'diagnostics' },
      --lualine_x = { 'lsp', 'treesitter', 'spaces', 'filesize' }, -- FIX: Treesitter / LSP / space
      --lualine_y = { 'progress' },
      --lualine_z = { 'location' },
    },
    --inactive_section = {
    --  lualine_b = {},
    --  lualine_c = { 'branch' },
    --  lualine_x = {},
    --  lualine_y = {},
    --  lualine_z = {},
    --},
  }
end

return M
