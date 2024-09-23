local M = {}

function M.setup()
  local configs = require('quantum.modules.ai.configs')
  local keymappings = require('quantum.modules.ai.keymappings')

  configs.setup()
  keymappings.setup()
end

return M
