require('catppuccin').setup({
	flavour = "mocha",
	integrations = {
		which_key = true,
		neogit = true,
		gitsigns = true,
		telescope = true,
	},
})

vim.cmd.colorscheme "catppuccin"
