local builtin = require('telescope.builtin')
local wk = require('which-key')
local m = vim.keymap.set

wk.add {
  { '<leader>f', group = 'Telescope' },
  { '<leader>i', group = 'Incremental selection' },
  { '<leader>x', group = 'Terminal' },
}

m('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
m('n', '<leader>fg', builtin.live_grep, { desc = 'Grep' })
m('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
m('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'TODO' })

m('n', '<leader>xt', '<cmd>ToggleTerm<cr>', { desc = 'Toggle terminal' })
m('n', '<leader>xa', '<cmd>ToggleTermToggleAll<cr>', { desc = 'Toggle all terminals' })
m('n', '<leader>xx', '<cmd>TermExec<cr>', { desc = 'Exec a terminal command' })
m('n', '<leader>xl', '<cmd>TermSelect<cr>', { desc = 'Select a terminal' })

m('n', '<leader>xsc', '<cmd>ToggleTermSendCurrentLine<cr>', { desc = 'Send current line' })
m('n', '<leader>xsl', '<cmd>ToggleTermSendVisualLines<cr>', { desc = 'Send visual line' })
m('n', '<leader>xsv', '<cmd>ToggleTermSendVisualSelection<cr>', { desc = 'Send visual selection' })

m('t', '<leader>t', '<c-\\><c-n><c-w>h', { desc = '' })
m('t', '<leader>s', '<c-\\><c-n><c-w>s', { desc = '' })
m('t', '<leader>r', '<c-\\><c-n><c-w>r', { desc = '' })
m('t', '<leader>n', '<c-\\><c-n><c-w>n', { desc = '' })
