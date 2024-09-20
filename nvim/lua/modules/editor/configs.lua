require('telescope').setup({}) -- TODO: Create shortcut and enhence configuration
require('telescope').load_extension('fzf')
-- TODO: add telescope tab extension

require("nvim-autopairs").setup({})
require("rainbow-delimiters.setup").setup({})
require("nvim-surround").setup({}) -- TODO: add which key tips
require("auto-save").setup({})
require("auto-session").setup({})

require("nvim-treesitter.configs").setup({
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

  textobjects = {
    select = {
      enable = true,

      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
        include_surrounding_whitespace = true,
      },
    },
  }
})
require('treesitter-context').setup({})
