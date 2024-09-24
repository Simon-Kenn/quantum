local M = {}

function M.setup()
  local opt = vim.opt

  opt.termguicolors = true

  opt.number = true
  opt.relativenumber = true
  opt.cursorline = true
  opt.cursorlineopt = 'number,line'
  opt.conceallevel = 3

  opt.virtualedit = 'block'
  opt.inccommand = 'split'
  opt.laststatus = 2
  opt.signcolumn = 'yes'
end

return M
