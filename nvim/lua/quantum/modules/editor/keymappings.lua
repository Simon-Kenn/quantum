local M = {}

function M.setup()
  local builtin = require("telescope.builtin")
  local wk = require("which-key")
  local map = vim.keymap.set

  wk.add({
    { "<leader>f", group = "Telescope" },
    { "<leader>i", group = "Incremental selection" },
    { "<leader>x", group = "Terminal" },
    { "<leader>h", group = "harpoon" },
  })

  ----map('n', '<leader>b', ":lua require('harpoon.mark').add_file()<cr>", { desc = 'Harpoon this!' })

  ----map('n', '<leader>"', ":lua require('harpoon.ui').nav_file(1)<cr>", { desc = 'Go to harp 1' })
  ----map('n', '<leader>«', ":lua require('harpoon.ui').nav_file(2)<cr>", { desc = 'Go to harp 2' })
  ----map('n', '<leader>»', ":lua require('harpoon.ui').nav_file(3)<cr>", { desc = 'Go to harp 3' })
  ----map('n', '<leader>', ":lua require('harpoon.ui').nav_file(4)<cr>", { desc = 'Go to harp 4' })
  ----map('n', '<leader>)', ":lua require('harpoon.ui').nav_file(5)<cr>", { desc = 'Go to harp 5' })
  ----map('n', '<leader>@', ":lua require('harpoon.ui').nav_file(6)<cr>", { desc = 'Go to harp 6' })

  ----map('n', '<leader>é', ":lua require('harpoon.ui').nav_prev()<cr>", { desc = 'prev' })
  ----map('n', '<leader>p', ":lua require('harpoon.ui').nav_next()<cr>", { desc = 'harpoon' })
  ----map('n', '<leader>fh', ':Telescope harpoon marks<cr>', { desc = 'Harpoons' })

  map("n", "<leader>o", "<Cmd>Oil<cr>", { desc = "Oil" })
  map("n", "w", "<Cmd>ZenMode<cr>", { desc = "Oil" })

  map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
  map("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
  map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
  map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "TODO" })

  map("n", "<leader>xt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
  map("n", "<leader>xa", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle all terminals" })
  map("n", "<leader>xx", "<cmd>TermExec<cr>", { desc = "Exec a terminal command" })
  map("n", "<leader>xl", "<cmd>TermSelect<cr>", { desc = "Select a terminal" })

  map("n", "<leader>xsc", "<cmd>ToggleTermSendCurrentLine<cr>", { desc = "Send current line" })
  map("n", "<leader>xsl", "<cmd>ToggleTermSendVisualLines<cr>", { desc = "Send visual line" })
  map(
    "n",
    "<leader>xsv",
    "<cmd>ToggleTermSendVisualSelection<cr>",
    { desc = "Send visual selection" }
  )

  map("t", "<leader>t", "<c-\\><c-n><c-w>h", { desc = "" })
  map("t", "<leader>s", "<c-\\><c-n><c-w>s", { desc = "" })
  map("t", "<leader>r", "<c-\\><c-n><c-w>r", { desc = "" })
  map("t", "<leader>n", "<c-\\><c-n><c-w>n", { desc = "" })
end

function M.on_attach(bufnr)
  local wk = require("which-key")
  local function buf_set_keymap(mode, lhs, rhs, desc, opts)
    opts = opts or {}
    opts.buffer = bufnr
    opts.desc = desc
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  local opts = { noremap = true, silent = true }
  wk.add({
    { "<leader>a", group = "LSP" },
  })

  buf_set_keymap("n", "gd", vim.lsp.buf.definition, "Goto definition", opts)
  buf_set_keymap("n", "gD", vim.lsp.buf.declaration, "Goto declaration", opts)
  buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", "References", opts)
  buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<cr>", "Goto implementation", opts)
  buf_set_keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", "Goto type definition", opts)
  buf_set_keymap("n", "R", vim.lsp.buf.hover, "Documentation", opts)
  buf_set_keymap("n", "gR", vim.lsp.buf.signature_help, "Signature help", opts)
  buf_set_keymap("n", "<leader>ar", vim.lsp.buf.rename, "Rename", opts)
  buf_set_keymap("n", "<leader>aa", vim.lsp.buf.code_action, "Code action", opts)

  buf_set_keymap("n", "<leader>ad", vim.diagnostic.open_float, "Diagnositics", opts)
  buf_set_keymap("n", "êd", vim.diagnostic.goto_prev, "Prev Diagnostic", opts)
  buf_set_keymap("n", "àd", vim.diagnostic.goto_next, "Next diagnostic", opts)
end

return M
