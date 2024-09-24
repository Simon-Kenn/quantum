local M = {}

function M.setup()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
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
      ["core.text-objects"] = {},
      ["core.integrations.telescope"] = {},
    },
  })
end

return M
