require('telescope').setup({})
require('telescope').load_extension('fzf')

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
