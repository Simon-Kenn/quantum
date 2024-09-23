local M  = {}

function M.setup()
	local configs = require('quantum.modules.git.configs')
	local keymappings = require('quantum.modules.git.keymappings')

	configs.setup()
	keymappings.setup()
end

return M
