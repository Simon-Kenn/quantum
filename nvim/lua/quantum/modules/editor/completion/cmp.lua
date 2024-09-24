local M = {}
local ls, cmp = require("luasnip"), require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local utils, icons, border =
  require("quantum.modules.editor.completion.utils"),
  require("quantum.modules.ui.utils").icons.kinds,
  require("quantum.modules.ui.utils").border

function M.setup()
  cmp.setup({
    snippet = {
      expand = function(args)
        ls.lsp_expand(args.body)
      end,
    },
    window = {
      completion = {
        border = border,
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      },
      documentation = {
        border = border,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      },
    },
    mapping = {
      ["<CR>"] = cmp.mapping(function(fallback)
        utils.confirm_selection(fallback, ls, cmp)
      end),
      ["<Tab>"] = cmp.mapping(function(fallback)
        utils.next_item(fallback, ls, cmp)
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        utils.prev_item(fallback, ls, cmp)
      end, { "i", "s" }),
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-e>"] = cmp.mapping.abort(),
    },
    sources = cmp.config.sources({
      {
        name = "lazydev",
        group_index = 0,
      },
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "path" },
      { name = "buffer" },
    }),
    formatting = {
      expandable_indicator = false,
      fields = { "kind", "abbr", "menu" },
      format = function(entry, item)
        if icons[item.kind] then
          item.kind = icons[item.kind] .. item.kind
        end
        return item
      end,
    },
  })

  cmp.setup.filetype("nix", {
    sources = {
      { name = "fonts", options = { space_filter = "-" } },
    },
  })

  cmp.setup.filetype("norg", {
    sources = {
      { name = "nerdfont" },
      { name = "emoji" },
    },
  })

  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "cmdline" },
    },
  })

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
