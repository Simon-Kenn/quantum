local function lsp_highlight_document(client, buffer)
  if client.server_capabilities.documentHighlightProvider then
    local augroup =
      vim.api.nvim_create_augroup("lsp_highlight_document" .. client.id, { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
      group = augroup,
      buffer = buffer,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = function()
        vim.lsp.buf.clear_references()
      end,
      group = augroup,
      buffer = buffer,
    })
    vim.api.nvim_create_autocmd("LspDetach", {
      callback = function(args)
        if args.data.client_id == client.id then
          vim.api.nvim_clear_autocmds({
            group = augroup,
          })
        end
      end,
      group = augroup,
    })
  end
end

return lsp_highlight_document
