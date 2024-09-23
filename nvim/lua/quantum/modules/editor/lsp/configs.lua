local mappings = require('quantum.modules.editor.keymappings')
local lspconfig = require('lspconfig')
local lazydev = require('lazydev')

local M = {}

function M.setup()
  lspconfig.rust_analyser.setup {
    on_attach = function(client, bufnr)
      mappings.on_attach(client, bufnr)
    end,
  }

  lspconfig.nil_ls.setup {
    on_attach = function(client, bufnr)
      mappings.on_attach(client, bufnr)
    end,
  }

  lazydev.setup() -- TODO: shoul be done only on lua file
  lspconfig.lua_ls.setup {
    on_attach = function(client, bufnr)
      mappings.on_attach(client, bufnr)
    end,
  }

  lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
      mappings.on_attach(client, bufnr)
    end,
  }
end

return M
