local M = {}

function M.setup()
  local config = require("quantum.modules.notes.configs")
  local keymappings = require("quantum.modules.notes.keymappings")

  config.setup()
  keymappings.setup()
end

return M
