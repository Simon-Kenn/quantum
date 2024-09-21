require('modules.editor.telescope')
require('modules.editor.treesitter')
require('modules.editor.lsp')
require('modules.editor.formatter')
require('modules.editor.completion')
-- TODO: look for flash.nvim

require('toggleterm').setup()
require('todo-comments').setup {}

require('nvim-surround').setup {} -- TODO: add which key tips

require('nvim-autopairs').setup {}
require('auto-save').setup {}
require('auto-session').setup {}

-- TODO: add linter
-- TODO: look for trouple.nvim
