local o = vim.opt

o.splitbelow = true
o.splitright = true

o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2

o.smartindent = true

o.scrolloff = 999

o.foldenable = true
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexp()"
o.foldtext = ""
o.fillchars = {
  foldclose = "",
  foldopen = "",
}
--o.foldcolumn = "1"
--o.foldlevel = 99
--o.foldlevelstart = 99

o.swapfile = false
o.backup = false
o.undodir = vim.fn.expand("~") .."/.vim/undodir"
o.undofile = true

o.ignorecase = true
