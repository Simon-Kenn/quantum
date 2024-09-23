local M = {}

function M.setup()
	local configs = require('quantum.modules.editor.configs')
	local keymappings = require('quantum.modules.editor.keymappings')
	local options = require('quantum.modules.editor.options')

	configs.setup()
	keymappings.setup()
	options.setup()
end

return M
