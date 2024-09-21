local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    -- TODO: enhence configuration, read the :h Telescope
    -- TODO: Mappings should be a function in keymappings.lua that we import here
    mappings = {
      i = {
        ["<LeftMouse>"] = {
          actions.mouse_click,
          type = "action",
          opts = { expr = true },
        },
        ["<2-LeftMouse>"] = {
          actions.double_mouse_click,
          type = "action",
          opts = { expr = true },
        },

        ["<C-s>"] = actions.move_selection_next,
        ["<C-r>"] = actions.move_selection_previous,

        ["<C-q>"] = actions.close,

        ["<Down>"] = false,
        ["<Up>"] = false,

        ["<CR>"] = actions.select_default,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-f>"] = actions.preview_scrolling_left,
        ["<C-k>"] = actions.preview_scrolling_right,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["<M-f>"] = actions.results_scrolling_left,
        ["<M-k>"] = actions.results_scrolling_right,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-/>"] = actions.which_key,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        ["<C-w>"] = { "<c-s-w>", type = "command" },
        ["<C-r><C-w>"] = actions.insert_original_cword,
        ["<C-r><C-a>"] = actions.insert_original_cWORD,
        ["<C-r><C-f>"] = actions.insert_original_cfile,
        ["<C-r><C-l>"] = actions.insert_original_cline,

        -- disable c-j because we dont want to allow new lines #2123
        ["<C-j>"] = actions.nop,
      },
      n = {
        ["<LeftMouse>"] = {
          actions.mouse_click,
          type = "action",
          opts = { expr = true },
        },
        ["<2-LeftMouse>"] = {
          actions.double_mouse_click,
          type = "action",
          opts = { expr = true },
        },

        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        -- TODO: This would be weird if we switch the ordering.
        ["s"] = actions.move_selection_next,
        ["r"] = actions.move_selection_previous,
        ["T"] = actions.move_to_top,
        ["N"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-f>"] = actions.preview_scrolling_left,
        ["<C-k>"] = actions.preview_scrolling_right,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["<M-f>"] = actions.results_scrolling_left,
        ["<M-k>"] = actions.results_scrolling_right,

        ["?"] = actions.which_key,
      },
    }
  },
}) 
require('telescope').load_extension('fzf')
-- TODO: add telescope tab extension
-- TODO: add telescope undo extension

-- TODO: look for flash.nvim

require('toggleterm').setup()

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

-- TODO: add lsp 
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({})
-- TODO: add linter
-- TODO: add formater
-- TODO: look for trouple.nvim
