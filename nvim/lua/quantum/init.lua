local M = {}

function M.setup()
  local core = require("quantum.modules.core")
  local editor = require("quantum.modules.editor")
  local ai = require("quantum.modules.ai")
  local git = require("quantum.modules.git")
  local ui = require("quantum.modules.ui")
  local notes = require("quantum.modules.notes")

  core.setup()
  editor.setup()
  ai.setup()
  git.setup()
  ui.setup()
  notes.setup()
end

return M
