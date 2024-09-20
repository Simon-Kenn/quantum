local m = vim.keymap.set
local wk = require('which-key')
local g = vim.g
local noremap = { "n", "v", "o"}

g.mapleader = " "

wk.add({
	{ "<leader>c", group = "Windows"},
	{ "<leader>t", group = "Tabs"}
})

m('n', "<leader>cs", "<C-w>s", { desc = "Split window"})
m('n', "<leader>cv", "<C-w>v", { desc = "Split window verticaly"})
m('n', "<leader>cw", "<C-w>w", { desc = "Switch windows"})
m('n', "<leader>cq", "<C-w>q", { desc = "Quit window"})
m('n', "<leader>co", "<C-w>o", { desc = "Close all other windows"})
m('n', "<leader>ct", "<C-w>T", { desc = "Break out into a new tab"})
m('n', "<leader>cx", "<C-w>x", { desc = "Swap current with next"})
m('n', "<leader>c+", "<C-w>+", { desc = "Increase height"})
m('n', "<leader>c-", "<C-w>-", { desc = "Decrease height"})
m('n', "<leader>c>", "<C-w>>", { desc = "Increase width"})
m('n', "<leader>c<", "<C-w><", { desc = "Decrease width"})
m('n', "<leader>c=", "<C-w>=", { desc = "Equally high and wide"})
m('n', "<leader>c_", "<C-w>_", { desc = "Max out the height"})
m('n', "<leader>c|", "<C-w>|", { desc = "Max out the width"})
m('n', "<C-t>", "<C-w>h", { desc = "Left window"})
m('n', "<C-s>", "<C-w>j", { desc = "Down window"})
m('n', "<C-r>", "<C-w>k", { desc = "Up window"})
m('n', "<C-n>", "<C-w>l", { desc = "Right window"})

m('n', "<leader>tn", ":$tabnew<cr>", {noremap = true, desc = "New tab"})
m('n', "<leader>tc", ":tabclose<cr>", {noremap = true, desc = "Close tab"})
m('n', "<leader>to", ":tabonly<cr>", {noremap = true, desc = "Tab only"})
m('n', "<leader>tmp", ":-tabmove<cr>", {noremap = true, desc = "Move te previous"})
m('n', "<leader>tmn", ":+tabmove<cr>", {noremap = true, desc = "Move to next"})


m("n", "W", "<cmd>WhichKey<cr>", { desc = "Which-key"})

m(noremap, "t", "h", { desc = "Left" })
m(noremap, "s", "j", { desc = "Down" })
m(noremap, "r", "k", { desc = "Up" })
m(noremap, "n", "l", { desc = "Right" })

m(noremap, "T", "H", { desc = "Home line of window"})
m(noremap, "N", "L", { desc = "Last line of window"})

m(noremap, "S", "J", { desc = "Join"})
m(noremap, "R", "K", { desc = "Help"})

m(noremap, "k", "t", { desc = "Move before next char"})
m(noremap, "K", "T", { desc = "Move before prev char"})

m(noremap, "j", "s", { desc = "Del [x] char"})
m(noremap, "J", "S", { desc = "Del [x] lines"})

m(noremap, "h", "r", { desc = "Replace"})
m(noremap, "H", "R", { desc = "Replace line"})

m(noremap, "l", "n", { desc = "Next result"})
m(noremap, "L", "N", { desc = "Last result"})

m(noremap, "gs", "gj", { desc = "line screen down"})
m(noremap, "gr", "gk", { desc = "line screen up"})

m(noremap, "é", "w", { desc = "Next word"})
m(noremap, "É", "W", { desc = "Next WORD"})

m(noremap, "è", "ge", { desc = "Prev end of word"})
m(noremap, "È", "gE", { desc = "Prev end of Word"})

m(noremap, "gé", "gt", { desc = "Go to the next tab page"})
m(noremap, "gb", "gT", { desc = "Go to the previous tab page"})

m("o", "aé", "aw", { desc = "word with ws"})
m("o", "aÉ", "aW", { desc = "WORD with ws"})
m("o", "ié", "iw", { desc = "inner word"})
m("o", "iÉ", "iW", { desc = "inner WORD"})
