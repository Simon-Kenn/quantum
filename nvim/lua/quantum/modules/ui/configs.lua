local M = {}

function M.setup()
  require('nvim-web-devicons').setup {}
  require('quantum.modules.ui.statusline').setup {}
  require('quantum.modules.ui.tabline').setup {}
  require('fidget').setup {}
  -- TODO: Pump it
  -- require('notify').setup {}
  -- require('alpha').setup {}
  -- TODO: add tree-navigation
  -- TODO: add welcome screen
  require('dashboard').setup()
end

return M
