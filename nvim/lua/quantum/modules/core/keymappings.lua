local M = {}

function M.setup()
	local map = vim.keymap.set
	local wk = require('which-key')
	local g = vim.g
	local noremap = { "n", "v", "o"}
	
	g.mapleader = " "
	
	wk.add({
		{ "<leader>c", group = "Windows"},
		{ "<leader>m", group = "Tabs"}
	})
	
	map('n', "<leader>ch", "<C-w>s", { desc = "Split window"})
	map('n', "<leader>cv", "<C-w>v", { desc = "Split window verticaly"})
	map('n', "<leader>cw", "<C-w>w", { desc = "Switch windows"})
	map('n', "<leader>cq", "<C-w>q", { desc = "Quit window"})
	map('n', "<leader>co", "<C-w>o", { desc = "Close all other windows"})
	map('n', "<leader>ct", "<C-w>T", { desc = "Break out into a new tab"})
	map('n', "<leader>cx", "<C-w>x", { desc = "Swap current with next"})
	map('n', "<leader>c+", "<C-w>+", { desc = "Increase height"})
	map('n', "<leader>c-", "<C-w>-", { desc = "Decrease height"})
	map('n', "<leader>c>", "<C-w>>", { desc = "Increase width"})
	map('n', "<leader>c<", "<C-w><", { desc = "Decrease width"})
	map('n', "<leader>c=", "<C-w>=", { desc = "Equally high and wide"})
	map('n', "<leader>c_", "<C-w>_", { desc = "Max out the height"})
	map('n', "<leader>c|", "<C-w>|", { desc = "Max out the width"})
	map('n', "<leader>t", "<C-w>h", { desc = ""})
	map('n', "<leader>s", "<C-w>j", { desc = ""})
	map('n', "<leader>r", "<C-w>k", { desc = ""})
	map('n', "<leader>n", "<C-w>l", { desc = ""})
	
	map('n', "<leader>mn", ":$tabnew<cr>", {noremap = true, desc = "New tab"})
	map('n', "<leader>mq", ":tabclose<cr>", {noremap = true, desc = "Close tab"})
	map('n', "<leader>mo", ":tabonly<cr>", {noremap = true, desc = "Tab only"})
	map('n', "<leader>mmp", ":-tabmove<cr>", {noremap = true, desc = "Move te previous"})
	map('n', "<leader>mmn", ":+tabmove<cr>", {noremap = true, desc = "Move to next"})
	
	
	map("n", "W", "<cmd>WhichKey<cr>", { desc = "Which-key"})
	
	map(noremap, "t", "h", { desc = "Left" })
	map(noremap, "s", "j", { desc = "Down" })
	map(noremap, "r", "k", { desc = "Up" })
	map(noremap, "n", "l", { desc = "Right" })
	
	map(noremap, "T", "H", { desc = "Home line of window"})
	map(noremap, "N", "L", { desc = "Last line of window"})
	
	map(noremap, "S", "J", { desc = "Join"})
	map(noremap, "R", "K", { desc = "Help"})
	
	map(noremap, "k", "t", { desc = "Move before next char"})
	map(noremap, "K", "T", { desc = "Move before prev char"})
	
	map(noremap, "j", "s", { desc = "Del [x] char"})
	map(noremap, "J", "S", { desc = "Del [x] lines"})
	
	map(noremap, "h", "r", { desc = "Replace"})
	map(noremap, "H", "R", { desc = "Replace line"})
	
	map(noremap, "l", "n", { desc = "Next result"})
	map(noremap, "L", "N", { desc = "Last result"})
	
	map(noremap, "gs", "gj", { desc = "line screen down"})
	map(noremap, "gr", "gk", { desc = "line screen up"})
	
	map(noremap, "é", "w", { desc = "Next word"})
	map(noremap, "É", "W", { desc = "Next WORD"})
	
	map(noremap, "è", "ge", { desc = "Prev end of word"})
	map(noremap, "È", "gE", { desc = "Prev end of Word"})
	
	map(noremap, "gé", "gt", { desc = "Go to the next tab page"})
	map(noremap, "gb", "gT", { desc = "Go to the previous tab page"})
	
	map("o", "aé", "aw", { desc = "word with ws"})
	map("o", "aÉ", "aW", { desc = "WORD with ws"})
	map("o", "ié", "iw", { desc = "inner word"})
	map("o", "iÉ", "iW", { desc = "inner WORD"})
end

return M
