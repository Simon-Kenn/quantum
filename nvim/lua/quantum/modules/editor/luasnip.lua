local M = {}
local ls = require('luasnip')

function M.setup() end

ls.config.set_config {
  updateevents = 'TextChanged,TextChangedI',
  enable
}

return M
