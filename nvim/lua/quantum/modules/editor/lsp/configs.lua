local on_attach = require("quantum.modules.editor.lsp.utils").on_attach
local border, icons =
  require("quantum.modules.ui.utils").border, require("quantum.modules.ui.utils").icons.diagnostics
local lspconfig = require("lspconfig")
local lazydev = require("lazydev")

local M = {}

function M.setup()
  lspconfig.rust_analyser.setup({ on_attach = on_attach })
  lspconfig.nil_ls.setup({ on_attach = on_attach })
  lspconfig.lua_ls.setup({ on_attach = on_attach })
  lspconfig.clangd.setup({ on_attach = on_attach })

  lazydev.setup({
    library = {
      "~/Codes/quantum",
    },
  }) -- TODO: shoul be done only on lua file

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = border,
    title = "Hover",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = border,
    title = "Signature",
  })

  local signs = { text = {}, numhl = {} }
  for severity, icon in pairs(icons) do
    signs.text[vim.diagnostic.severity[severity]] = icon
    signs.numhl[vim.diagnostic.severity[severity]] = "diagnostic" .. severity
  end

  vim.diagnostic.config({
    float = {
      focusable = true,
      border = border,
      scope = "cursor",
      title = "Diagnostics",
      min_width = 12,
      header = "",
      suffix = "",
      prefix = function(diagnostic, _, _)
        local icon, highlight
        if diagnostic.severity == 1 then
          icon = icons.error
          highlight = "DiagnosticError"
        elseif diagnostic.severity == 2 then
          icon = icons.warning
          highlight = "DiagnosticWarn"
        elseif diagnostic.severity == 3 then
          icon = icons.info
          highlight = "DiagnosticInfo"
        elseif diagnostic.severity == 4 then
          icon = icons.hint
          highlight = "DiagnosticHint"
        end
        return icon, highlight
      end,
    },
    signs = signs,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })
end

return M
