local M = {}
local cmp = require('cmp')
local kind_icons = {}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local ls = require('luasnip')
-- TODO: Clean this file
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

local confirm_selection = cmp.mapping(function(fallback)
  if cmp.visible() then
    if ls.expandable() then
      ls.expand()
    else
      cmp.confirm {
        select = true,
      }
    end
  else
    fallback()
  end
end)

local next_item = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif ls.locally_jumpable(1) then
    ls.jump(1)
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end, { 'i', 's' })

local prev_item = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif ls.locally_jumpable(-1) then
    ls.jump(-1) -- FIX: This don't work, need further investigation
  else
    fallback()
  end
end, { 'i', 's' })

function M.setup()
  cmp.setup {
    snippet = {
      expand = function(args)
        ls.lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<CR>'] = confirm_selection,
      ['<Tab>'] = next_item,
      ['<S-Tab>'] = prev_item,
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-c>'] = cmp.mapping.abort(),
      ['<C-g>'] = cmp.mapping.abort(),
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
      { name = 'nerdfont' },
      { name = 'emoji' },
    }),
    performance = {
      debounce = 100,
      throttle = 50,
      fetching_timeout = 500,
    },
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

  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M
