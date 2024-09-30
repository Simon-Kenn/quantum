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
      ["core.keybinds"] = {
        config = {
          default_keybinds = false,
        },
      },
      ["core.text-objects"] = {},
      ["core.integrations.telescope"] = {},
    },
  })
end

return M
