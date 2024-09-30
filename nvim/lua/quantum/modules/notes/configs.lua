local utils = require("quantum.modules.notes.utils")
local M = {}

-- TODO: add image support

function M.setup()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "diamond",
          icons = {
            todo = {
              done = { icon = "󰸞" },
              on_hold = { icon = "󰏤" },
              urgent = { icon = "󱈸" },
              uncertain = { icon = "" },
              recurring = { icon = "" },
              pending = { icon = "" },
            },
          },
        },
      },

      ["core.dirman"] = {
        config = {
          workspaces = {
            cervauII = "~/CerveauII",
          },
          default_workspace = "cervauII",
        },
      },
      ["core.esupports.metagen"] = {
        config = {
          type = "auto",
        },
      },
      ["core.journal"] = {
        config = {
          toc_format = function(entries)
            return utils.toc_format(entries)
          end,
        },
      },
      ["core.keybinds"] = {
        config = {
          default_keybinds = false,
        },
      },
      ["core.completion"] = {
        config = {
          engine = { module_name = "external.lsp-completion" },
        },
      },
      ["core.text-objects"] = {},
      ["core.integrations.telescope"] = {},

      ["external.interim-ls"] = {
        config = {
          completion_provider = {
            enable = true,
            categories = false,
          },
        },
      },
      ["external.templates"] = {
        config = {},
      },
    },
  })
end

return M
