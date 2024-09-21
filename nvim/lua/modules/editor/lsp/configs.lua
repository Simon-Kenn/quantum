local lspconfig = require('lspconfig')
local on_attach = require ('modules.editor.lsp.keymappings')

lspconfig.clangd.setup({ on_attach = on_attach })
