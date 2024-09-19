local builtin = require('telescope.builtin')
local neogit = require('neogit')
local gitsigns = require('gitsigns')
local wk = require('which-key')
local m = vim.keymap.set

wk.add({
	{ "<leader>g", group = "Git"},
	{ "<leader>gg", group = "Gitsigns"}
})

m('n', '<leader>gn', neogit.open, { desc = 'Neogit'})
m('n', '<leader>gc', builtin.git_commits, { desc = 'Commits'})
m('n', '<leader>gb', builtin.git_branches, { desc = 'Branches'})
m('n', '<leader>gs', builtin.git_status, { desc = 'Status'})
m('n', '<leader>gt', builtin.git_stash, { desc = 'Stash'})

m('n', '<leader>ggs', gitsigns.stage_hunk, { desc = 'Stage hunk'})
m('n', '<leader>ggr', gitsigns.reset_hunk, { desc = 'Reset hunk'})
m('n', '<leader>ggu', gitsigns.undo_stage_hunk, { desc = 'Undo hunk'})
m('n', '<leader>ggS', gitsigns.stage_buffer, { desc = 'Stage buffer'})
m('n', '<leader>ggU', gitsigns.reset_buffer, { desc = 'Reset buffer'})
m('n', '<leader>ggd', gitsigns.diffthis, { desc = 'Diff this'})
m('n', '<leader>ggb', gitsigns.toggle_current_line_blame, { desc = 'Blame it!'})

