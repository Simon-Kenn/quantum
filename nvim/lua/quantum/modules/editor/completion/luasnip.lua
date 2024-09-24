local M = {}

function M.setup()
  require("luasnip").config.setup({
    upddate_events = { "TextChanged", "TextChangedI" },
    enable_autosnippets = true,
    history = true,
  })

  require("luasnip.loaders.from_lua").lazy_load({
    paths = vim.fn.stdpath("config") .. "/snippets",
  })
end

return M
