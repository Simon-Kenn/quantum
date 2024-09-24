local M = {}

function M.setup()
  local cmp = require("quantum.modules.editor.completion.cmp")
  local luasnip = require("quantum.modules.editor.completion.luasnip")

  cmp.setup()
  luasnip.setup()
end

return M
