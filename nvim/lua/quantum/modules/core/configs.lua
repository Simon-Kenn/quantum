local M = {}

function M.setup()
  require("which-key").setup({
    preset = "modern",
    icons = {
      rules = {
        { pattern = "tag", icon = "", hl = "@string" },
        { pattern = "task", icon = "", hl = "@string" },
        { pattern = "agenda", icon = "", hl = "@string" },
        { pattern = "calendar", icon = "", hl = "@string" },
        { pattern = "list", icon = "", hl = "@string" },
        { pattern = "note", icon = "", hl = "@string" },
        { pattern = "link", icon = "󰌹", hl = "@string" },
        { pattern = "toc", icon = "󱏒", hl = "@string" },
        { pattern = "date", icon = "󰃭", hl = "@string" },
        { pattern = "index", icon = "󰦄", hl = "@string" },
        { pattern = "journal", icon = "", hl = "@string" },

        { plugin = "oil.nvim", icon = "󰏇", hl = "@string" },
        { pattern = "selecton", icon = "󰒉", hl = "@string" },
        { pattern = "code", icon = "", hl = "@string" },
        { pattern = "explorer", icon = "󰙅", hl = "@string" },
        { pattern = "paste", icon = "", hl = "@string" },
        { pattern = "yank", icon = "", hl = "@label" },
        { pattern = "insert", icon = "", hl = "@string" },
        { pattern = "save", icon = "󰆓", hl = "@number" },
        { pattern = "buffer", icon = "", hl = "Structure" },
        { pattern = "tab", icon = "", color = "red" },
        { pattern = "grep", icon = "", color = "red" },
        { pattern = "browser", icon = "", color = "red" },
        { pattern = "help", icon = "", color = "red" },
        { pattern = "buffers", icon = "", color = "red" },
        { pattern = "view", icon = "", color = "red" },
        { pattern = "error", icon = "", hl = "@number" },
        { pattern = "quickfix", icon = "", hl = "Structure" },
      },
    },
  })
end

return M
