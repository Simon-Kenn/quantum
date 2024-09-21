require('conform').setup({
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    rust = { "rustfmt" },
    nix = { "nixfmt-classic" };
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
