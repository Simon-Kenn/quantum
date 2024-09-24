local M = {}
local map = vim.keymap.set

function M.setup()
  map("n", "<leader>j", "<cmd>Neotree toggle reveal<cr>", { desc = "Explorer" })
end

return M
