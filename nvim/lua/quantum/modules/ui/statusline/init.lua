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
      lualine_c = { components.diff, components.diagnostic, components.filename },
      lualine_x = {
        components.lsp,
        components.treesitter,
        components.filesize,
      },
      lualine_y = { components.location },
      lualine_z = { components.scrollbar, components.clock },
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
