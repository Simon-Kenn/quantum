local on_attach = require("quantum.modules.editor.lsp.utils").on_attach
local lspconfig = require("lspconfig")
local lazydev = require("lazydev")

local M = {}

function M.setup()
  lspconfig.rust_analyser.setup({ on_attach = on_attach })
  lspconfig.nil_ls.setup({ on_attach = on_attach })
  lspconfig.lua_ls.setup({ on_attach = on_attach })
  lspconfig.clangd.setup({ on_attach = on_attach })

  lazydev.setup({
    library = {
      "~/Codes/quantum",
    },
  }) -- TODO: shoul be done only on lua file
end

return M
