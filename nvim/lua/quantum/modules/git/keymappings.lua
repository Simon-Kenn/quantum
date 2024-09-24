local M = {}

function M.setup()
  local builtin = require("telescope.builtin")
  local neogit = require("neogit")
  local gitsigns = require("gitsigns")
  local wk = require("which-key")
  local map = vim.keymap.set
  wk.add({
    { "<leader>g", group = "Git" },
    { "<leader>gg", group = "Gitsigns" },
  })

  map("n", "<leader>gn", neogit.open, { desc = "Neogit" })
  map("n", "<leader>gc", builtin.git_commits, { desc = "Commits" })
  map("n", "<leader>gb", builtin.git_branches, { desc = "Branches" })
  map("n", "<leader>gs", builtin.git_status, { desc = "Status" })
  map("n", "<leader>gt", builtin.git_stash, { desc = "Stash" })

  map("n", "<leader>ggs", gitsigns.stage_hunk, { desc = "Stage hunk" })
  map("n", "<leader>ggr", gitsigns.reset_hunk, { desc = "Reset hunk" })
  map("n", "<leader>ggu", gitsigns.undo_stage_hunk, { desc = "Undo hunk" })
  map("n", "<leader>ggS", gitsigns.stage_buffer, { desc = "Stage buffer" })
  map("n", "<leader>ggU", gitsigns.reset_buffer, { desc = "Reset buffer" })
  map("n", "<leader>ggd", gitsigns.diffthis, { desc = "Diff this" })
  map("n", "<leader>ggb", gitsigns.toggle_current_line_blame, { desc = "Blame it!" })
end

return M
