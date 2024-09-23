local M = {}

function M.setup()
	local opt = vim.opt

	opt.termguicolors = true

	opt.number = true
	opt.relativenumber = true
	opt.foldlevel = 100
	opt.cursorline = true
	opt.conceallevel = 3

	opt.virtualedit = "block"
	opt.inccommand = "split"
end

return M
