function on_attach(client, bufnr)
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  map('n', "grn", vim.lsp.buf.rename, opts, { desc = "Rename" })
  map({'v', 'n'}, "gra", vim.lsp.buf.code_action, opts, { desc = "Code action" })
  map('n', "grr", vim.lsp.buf.references, opts, { desc = "References" })
  map('i', "<c-u>", vim.lsp.buf.signature_help, opts, { desc = "Signature help" })

  map('n', "R", vim.lsp.buf.hover, opts, { desc = "Help/Hover" })

  map('n', "gd", vim.lsp.buf.definition, opts, { desc = "Go to definition" })
  map('n', "gD", vim.lsp.buf.implementation, opts, { desc = "Go to implementation" })
  map('n', "g0", vim.lsp.buf.document_symbol, opts, { desc = "Document symbol" })
end

return on_attach
