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
  require('auto-session').setup {}

  require('Comment').setup()
  require('zen-mode').setup()
  require('twilight').setup()

  -- TODO: add trouble.nvim
  -- TODO: add flash.nvim
  -- TODO: add overseer
end

return M
