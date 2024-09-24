local mappings = require("quantum.modules.editor.keymappings")
local lsp_highlight_document = require("quantum.modules.editor.lsp.highlight")
local lspconfig = require("lspconfig")
local lazydev = require("lazydev")

local M = {}

function M.setup()
  lspconfig.rust_analyser.setup({
    on_attach = function(client, bufnr)
      mappings.on_attach(bufnr)
      lsp_highlight_document(client, bufnr)
    end,
  })

  lspconfig.nil_ls.setup({
    on_attach = function(client, bufnr)
      mappings.on_attach(bufnr)
      lsp_highlight_document(client, bufnr)
    end,
  })

  lazydev.setup({
    library = {
      "~/Codes/quantum",
    },
  }) -- TODO: shoul be done only on lua file

  lspconfig.lua_ls.setup({
    on_attach = function(client, bufnr)
      mappings.on_attach(bufnr)
      lsp_highlight_document(client, bufnr)
    end,
  })

  lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
      mappings.on_attach(bufnr)
      lsp_highlight_document(client, bufnr)
    end,
  })
end

return M
