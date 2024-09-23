local M = {}

function M.setup()
  require('quantum.modules.git.gitsigns').setup {}
  require('quantum.modules.git.neogit').setup {}
end

return M
