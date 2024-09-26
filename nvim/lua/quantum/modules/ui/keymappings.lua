local M = {}
local map = vim.keymap.set

local function rename_tab()
  vim.ui.input({ prompt = "Tab Name: " }, function(input)
    if input ~= "" then
      vim.api.nvim_command("TabRename " .. input)
    else
      print("No name provided")
    end
  end)
end

function M.setup()
  map("n", "<leader>j", "<cmd>Neotree toggle reveal<cr>", { desc = "Explorer" })
  map("n", "<leader>mr", function()
    rename_tab()
  end, { desc = "rename tab" })
end

return M
