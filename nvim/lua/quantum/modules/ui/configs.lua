local M = {}

function M.setup()
  require("nvim-web-devicons").setup({})
  require("quantum.modules.ui.statusline").setup({})
  require("quantum.modules.ui.tabline").setup({})
  require("quantum.modules.ui.statuscol").setup({})
  require("quantum.modules.ui.startup").setup({})
  require("quantum.modules.ui.tree").setup({})
  require("fidget").setup({})
  -- TODO: Pump it
  -- require('notify').setup {}
  -- TODO: add tree-navigation
  -- TODO: add welcome screen
end

return M
