local M = {}

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
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'diff', 'diagnostics' },
      lualine_x = { 'lsp', 'treesitter', 'spaces', 'filesize' }, -- FIX: Treesitter / LSP / space
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  }
end

return M
