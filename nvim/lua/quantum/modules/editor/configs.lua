local M = {}

function M.setup()
  require('quantum.modules.editor.telescope').setup {}
  require('quantum.modules.editor.treesitter').setup {}
  require('quantum.modules.editor.lsp').setup {}
  require('quantum.modules.editor.completion').setup {}
  require('quantum.modules.editor.luasnip').setup()
  require('quantum.modules.editor.formatter').setup {}
  require('quantum.modules.editor.oil').setup {}

  require('harpoon').setup {
    tabline = true,
  }

  require('toggleterm').setup()
  require('todo-comments').setup {}

  require('nvim-surround').setup {} -- TODO: add which key tips

  require('nvim-autopairs').setup {}
  require('auto-save').setup {}
  require('auto-session').setup {
    bypass_save_filetypes = { 'dashboard' },
  }

  require('Comment').setup()
  require('zen-mode').setup()
  require('twilight').setup()

  -- NOTE: make usage of it
  -- require('flash').setup()
  -- require('trouble').setup {}
  -- require('overseer').setup {}
end

return M
