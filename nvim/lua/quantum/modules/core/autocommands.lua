local M = {}

function M.setup()

	vim.api.nvim_create_autocmd("TermOpen", {
	  callback = function()
	    vim.opt_local.spell = false
	    vim.opt_local.number = false
	    vim.opt_local.relativenumber = false
	    vim.opt_local.signcolumn = "no"
	  end,
	  group = vim.api.nvim_create_augroup("terminal_settings", {}),
	})
end

return M
