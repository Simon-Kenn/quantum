local M = {}

function M.setup()
	local builtin = require('telescope.builtin')
	local wk = require('which-key')
	local map = vim.keymap.set

	wk.add {
	  { '<leader>f', group = 'Telescope' },
	  { '<leader>i', group = 'Incremental selection' },
	  { '<leader>x', group = 'Terminal' },
	}

	map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
	map('n', '<leader>fg', builtin.live_grep, { desc = 'Grep' })
	map('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
	map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'TODO' })

	map('n', '<leader>xt', '<cmd>ToggleTerm<cr>', { desc = 'Toggle terminal' })
	map('n', '<leader>xa', '<cmd>ToggleTermToggleAll<cr>', { desc = 'Toggle all terminals' })
	map('n', '<leader>xx', '<cmd>TermExec<cr>', { desc = 'Exec a terminal command' })
	map('n', '<leader>xl', '<cmd>TermSelect<cr>', { desc = 'Select a terminal' })

	map('n', '<leader>xsc', '<cmd>ToggleTermSendCurrentLine<cr>', { desc = 'Send current line' })
	map('n', '<leader>xsl', '<cmd>ToggleTermSendVisualLines<cr>', { desc = 'Send visual line' })
	map('n', '<leader>xsv', '<cmd>ToggleTermSendVisualSelection<cr>', { desc = 'Send visual selection' })

	map('t', '<leader>t', '<c-\\><c-n><c-w>h', { desc = '' })
	map('t', '<leader>s', '<c-\\><c-n><c-w>s', { desc = '' })
	map('t', '<leader>r', '<c-\\><c-n><c-w>r', { desc = '' })
	map('t', '<leader>n', '<c-\\><c-n><c-w>n', { desc = '' })
end

function M.on_attach(client, bufnr)
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

  --buf_set_keymap('n', '<leader>e', vim.diagnostic.open_float, "Afficher les diagnostics", opts)
  --buf_set_keymap('n', '[d', vim.diagnostic.goto_prev, "Diagnostic précédent", opts)
  --buf_set_keymap('n', ']d', vim.diagnostic.goto_next, "Diagnostic suivant", opts)
  --buf_set_keymap('n', '<leader>q', vim.diagnostic.setloclist, "Ouvrir la liste des diagnostics", opts)

end

return M
