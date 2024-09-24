local M = {}

function M.setup()
  require('catppuccin').setup {
    flavour = 'mocha',
    integrations = {
      cmp = true,
      which_key = true,
      telescope = { style = 'nvchad' },
      treesitter = true,
      treesitter_context = true,
      rainbow_delimiters = true,
      nvim_surround = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
          ok = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
          ok = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      harpoon = true,
      diffview = true,
      neogit = true,
      gitsigns = true,
      alpha = true,
      notify = true,
      fidget = true,
      fzf = true,
      neotree = true,
    },
  }

  vim.cmd.colorscheme('catppuccin')
end

return M
