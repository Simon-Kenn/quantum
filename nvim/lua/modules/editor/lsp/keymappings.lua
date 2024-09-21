function on_attach(client, bufnr)
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  map('n', 'R', vim.lsp.buf.hover, opts, { desc = 'Help/Hover' })

  map('n', 'gd', vim.lsp.buf.definition, opts, { desc = 'Go to definition' })
  map('n', 'gD', vim.lsp.buf.declaration, opts, { desc = 'Go to declaration' })
  map('n', 'gi', vim.lsp.buf.inmplementation, opts, { desc = 'Go to implementation' })
  map('n', 'gr', vim.lsp.buf.references, opts, { desc = 'References' })

  map('n', 'grn', vim.lsp.buf.rename, opts, { desc = 'Rename' })

  map({ 'v', 'g.' }, 'gra', vim.lsp.buf.code_action, opts, { desc = 'Code action' })
  map('i', '<c-u>', vim.lsp.buf.signature_help, opts, { desc = 'Signature help' })
end

return on_attach
