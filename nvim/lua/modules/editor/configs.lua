require('telescope').setup({}) -- TODO: Create shortcut and enhence configuration
require('telescope').load_extension('fzf')

require("nvim-autopairs").setup({})
require("auto-save").setup({})
require("auto-session").setup({})

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>is",
      node_incremental = "<leader>ii",
      scope_incremental = "<leader>ic",
      node_decremental = "<leader>id",
    },
  },
})
