local M = {}

function M.setup()
  require('luasnip').config.setup {
    upddate_events = { 'TextChanged', 'TextChangedI' },
    enable_autosnippets = true,
    history = true,
  }

  require('luasnip.loaders.from_lua').lazy_load {
    paths = { './snippets' }, -- FIX: not working
  }
end

return M
