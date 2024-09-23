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

return M
