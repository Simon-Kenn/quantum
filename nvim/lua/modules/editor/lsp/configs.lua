require('lazydev')
local lspconfig = require('lspconfig')
local on_attach = require('modules.editor.lsp.keymappings')

lspconfig.rust_analyser.setup { on_attach = on_attach }
lspconfig.nil_ls.setup { on_attach = on_attach }
lspconfig.lua_ls.setup { on_attach = on_attach }
lspconfig.clangd.setup { on_attach = on_attach }