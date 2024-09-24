local palette = require('quantum.modules.ui.utils').palette

local M = {}
M.conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.o.columns > 100
  end,
  has_lsp_clients = function()
    local clients = vim.lsp.get_clients { bufnr = 0 }
    return #clients > 0
  end,
}

M.components = {
  mode = {
    'mode',
    fmt = function(str)
      return string.sub(str, 1, 1)
    end,
    separator = {
      right = '',
      left = '',
    },
  },

  branch = {
    'branch',
    icon = { '', color = { fg = palette.pink, gui = 'bold' } },
    color = { gui = 'bold' },
    separator = {
      right = '',
    },
  },
}
return M
