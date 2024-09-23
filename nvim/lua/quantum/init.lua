local M = {}

function M.setup()
  local core = require('quantum.modules.core')
  local editor = require('quantum.modules.editor')
  local ui = require('quantum.modules.ui')
  local git = require('quantum.modules.git')

  core.setup()
	editor.setup()
	ui.setup()
	git.setup()
end

return M
