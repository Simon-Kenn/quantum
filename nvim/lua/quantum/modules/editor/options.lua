local M = {}

function M.setup()
  local o = vim.opt

  o.splitbelow = true
  o.splitright = true

  o.expandtab = true
  o.smartindent = true
  o.shiftround = true
  o.shiftwidth = 2
  o.softtabstop = 2

  o.smartindent = true

  o.scrolloff = 999

  o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

  o.foldlevel = 99
  o.foldenable = true
  -- o.foldcolumn = 'auto'
  o.foldtext = ''
  o.foldmethod = 'expr'
  o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  o.fillchars = {
    eob = ' ',
    fold = ' ',
    foldsep = ' ',
    foldopen = '',
    foldclose = '',
  }
  o.list = true --show some hidden characters
  o.listchars = {
    tab = '> ',
    nbsp = '␣',
    trail = '•',
  }

  o.swapfile = false
  o.backup = false
  o.undodir = vim.fn.expand('~') .. '/.vim/undodir'
  o.undofile = true

  o.ignorecase = true
  o.incsearch = true
  o.smartcase = true
  o.hlsearch = true
end

return M
