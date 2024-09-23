local M = {}
local cmp = require('cmp')
local ls = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local utils = require('quantum.modules.editor.completion.utils')
local kind_icons = require('quantum.modules.editor.completion.kind').icons

function M.setup()
  cmp.setup {
    snippet = {
      expand = function(args)
        ls.lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<CR>'] = cmp.mapping(function(fallback)
        utils.confirm_selection(fallback, ls, cmp)
      end),
      ['<Tab>'] = cmp.mapping(function(fallback)
        utils.next_item(fallback, ls, cmp)
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        utils.prev_item(fallback, ls, cmp)
      end, { 'i', 's' }),
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
    }),
    formatting = {
      fields = { 'abbr', 'kind' },
      format = function(entry, vim_item)
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
        vim_item.menu = ({
          buffer = '[Buffer]',
          nvim_lsp = '[LSP]',
          luasnip = '[Luasnip]',
          path = '[Path]',
          lazydev = '[Lazydev]',
          fonts = '[Fonts]',
          emoji = '[Emoji]',
          nerdfont = '[Nerdfont]',
        })[entry.source.name]
        return vim_item
      end,
    },
  }

  cmp.setup.filetype('nix', {
    sources = {
      { name = 'fonts', options = { space_filter = '-' } },
    },
  })

  cmp.setup.filetype('norg', {
    sources = {
      { name = 'nerdfont' },
      { name = 'emoji' },
    },
  })

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
