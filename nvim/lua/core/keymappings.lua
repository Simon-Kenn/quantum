local m = vim.keymap.set
local noremap = { "n", "v", "o"}

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

m(noremap, "gb", "gt", { desc = "Go to the next tab page"})
m(noremap, "gé", "gT", { desc = "Go to the previous tab page"})

m("o", "aé", "aw", { desc = "word with ws"})
m("o", "aÉ", "aW", { desc = "WORD with ws"})
m("o", "ié", "iw", { desc = "inner word"})
m("o", "iÉ", "iW", { desc = "inner WORD"})
