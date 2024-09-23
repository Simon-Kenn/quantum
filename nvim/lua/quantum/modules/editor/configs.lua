local M = {}

function M.setup() 
require('quantum.modules.editor.telescope')
require('quantum.modules.editor.treesitter')
require('quantum.modules.editor.lsp')
require('quantum.modules.editor.formatter')
require('quantum.modules.editor.completion')

require('toggleterm').setup()
require('todo-comments').setup {}

require('nvim-surround').setup {} -- TODO: add which key tips

require('nvim-autopairs').setup {}
require('auto-save').setup {}
require('auto-session').setup {}

-- TODO: add trouble.nvim
-- TODO: add flash.nvim
-- TODO: add harpoon
-- TODO: add oil
-- TODO: add luasnip
-- TODO: add overseer
-- TODO: add twilight and focus mode
-- TODO: add comment.nvim

-- FIX: todo-comments, git-signs, and lsp is not well displayed on status bar
end

return M
