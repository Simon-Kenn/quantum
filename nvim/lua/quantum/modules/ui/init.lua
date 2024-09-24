local M = {}

function M.setup()
	local theme = require('quantum.modules.ui.theme')
	local configs = require('quantum.modules.ui.configs')
	local options = require('quantum.modules.ui.options')
	local keymappings = require('quantum.modules.ui.keymappings')

	theme.setup()
	configs.setup()
	options.setup()
	keymappings.setup()

end

return M
