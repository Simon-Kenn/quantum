local function on_attach(client, bufnr)
  local function buf_set_keymap(mode, lhs, rhs, desc, opts)
    opts = opts or {}
    opts.buffer = bufnr
    opts.desc = desc
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  local opts = { noremap = true, silent = true }

  -- TODO: enhence lsp keymappings
  buf_set_keymap('n', 'gd', vim.lsp.buf.definition, 'Go to definition', opts)
  buf_set_keymap('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration', opts)
  buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation', opts)
  buf_set_keymap('n', 'gr', vim.lsp.buf.references, 'References', opts)
  buf_set_keymap('n', 'R', vim.lsp.buf.hover, 'Documentation', opts)
  buf_set_keymap('n', 'gn', vim.lsp.buf.rename, 'Rename', opts)
  buf_set_keymap('n', 'g.', vim.lsp.buf.code_action, 'Code action', opts)
end

return on_attach
