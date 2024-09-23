local M = {}

function M.setup()
  require('gitsigns').setup {
    current_line_blame = true,
    -- TODO: add better icons
  }
end

return M
