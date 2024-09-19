local builtin = require('telescope.builtin')
local neogit = require('neogit')
local wk = require('which-key')
local m = vim.keymap.set

wk.add({
	{ "<leader>g", group = "Git"}
})

m('n', '<leader>gn', '<cmd>Neogit<cr>', { desc = 'Neogit'})
m('n', '<leader>gc', builtin.git_commits, { desc = 'Commits'})
m('n', '<leader>gb', builtin.git_branches, { desc = 'Branches'})
m('n', '<leader>gs', builtin.git_status, { desc = 'Status'})
m('n', '<leader>gt', builtin.git_stash, { desc = 'Stash'})
