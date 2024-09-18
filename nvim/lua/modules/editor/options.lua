local o = vim.opt

o.splitbelow = true
o.splitright = true

o.smarttab = true
o.autoindent = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2

o.scrolloff = 999

o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

o.swapfile = false
o.backup = false
o.undodir = vim.fn.expand("~") .."/.vim/undodir"
o.undofile = true

o.ignorecase = true
