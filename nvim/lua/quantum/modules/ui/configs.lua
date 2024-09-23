local M = {}

function M.setup()
  require('nvim-web-devicons').setup {}
  require('quantum.modules.ui.lualine').setup {}
  require('quantum.modules.ui.tabline').setup {}
  -- TODO: add fidget
  -- TODO: add notification
  -- TODO: add tree-navigation
  -- TODO: add oil
  -- TODO: add welcome screen
end

return M
