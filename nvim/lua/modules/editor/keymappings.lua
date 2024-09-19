local builtin = require('telescope.builtin')
local wk = require('which-key')
local m = vim.keymap.set

wk.add({
	{ "<leader>f", group = "Telescope"},
})

m('n', '<leader>ff', builtin.find_files, {desc = 'Find files'})
m('n', '<leader>fg', builtin.live_grep, {desc = 'Grep'})
m('n', '<leader>fb', builtin.buffers, {desc = 'Buffers'})
