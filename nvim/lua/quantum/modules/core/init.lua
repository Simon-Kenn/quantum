local M = {}

function M.setup()
	local options = require('quantum.modules.core.options')
  local configs = require('quantum.modules.core.configs')
  local keymappings = require('quantum.modules.core.keymappings')
  local autocommands = require('quantum.modules.core.autocommands')

	options.setup()
	configs.setup()
	keymappings.setup()
	autocommands.setup()
end

return M
