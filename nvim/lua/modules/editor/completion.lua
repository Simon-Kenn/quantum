local cmp = require('cmp')
local kind_icons = {}
-- TODO: Clean this file
-- TODO: add other source (nerdfonts, etc…)
-- TODO: add mapping
-- TODO function imp should add parenthesis

kind_icons.icons = {
  Class = '  ',
  Color = '  ',
  Constant = '  ',
  Constructor = '  ',
  Enum = ' 了',
  EnumMember = '  ',
  Event = '  ',
  Field = ' 󰜢 ',
  File = '  ',
  Folder = '  ',
  Function = '  ',
  Interface = '  ',
  Keyword = '  ',
  Method = ' ƒ ',
  Module = '  ',
  Operator = ' 󰆕 ',
  Property = '  ',
  Reference = '  ',
  Snippet = '  ',
  Struct = '  ',
  Text = '  ',
  TypeParameter = '',
  Unit = ' 󰑭 ',
  Value = ' 󰎠 ',
  Variable = '  ',
}
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local tab_complete = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end

local s_tab_complete = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()()
  else
    fallback()
  end
end

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = tab_complete,
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-c>'] = cmp.mapping.abort(),
    ['<C-g>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = false },
  },
  sources = cmp.config.sources({
    {
      name = 'lazydev',
      group_index = 0,
    },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'path' },
    { name = 'buffer' },
  }),
  formating = {
    format = function(entry, vim_item) -- FIX: Icon not displaying properly
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        luasnip = '[LuaSnip]',
        nvim_lua = '[Lua]',
        latex_symbols = '[LaTeX]',
      })[entry.source.name]
      return vim_item
    end,
  },
}

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
  matching = { disallow_symbol_nonprefix_matching = false },
})
