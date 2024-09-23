local M = {}

function M.setup()
  local core = require('quantum.modules.core')
  local editor = require('quantum.modules.editor')
  local ai = require('quantum.modules.ai')
  local git = require('quantum.modules.git')
  local ui = require('quantum.modules.ui')

  core.setup()
  editor.setup()
  ai.setup()
  git.setup()
  ui.setup()
end

return M
