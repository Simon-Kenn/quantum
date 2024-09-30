local M = {}
local wk = require("which-key")
local set_keys_for = require("neorg.modules.core.keybinds.module").public.set_keys_for

local preset = {
  all = {
    n = {
      -- Notes --
      { -- New note
        "<localleader>nn",
        "<Plug>(neorg.dirman.new-note)",
        opts = { desc = "Create New Note" },
      },
      { -- Go to index
        "<localleader>ni",
        "<cmd>Neorg index<cr>",
        opts = { desc = "Go to index" },
      },
      { -- Find notes
        "<localleader>fn",
        "<cmd>Telescope neorg find_norg_files<cr>",
        opts = { desc = "Search notes" },
      },
      { -- Find linkable
        "<localleader>fl",
        "<cmd>Telescope neorg find_linkable<cr>",
        opts = { desc = "Search link" },
      },

      -- Journal --
      { -- today page
        "<localleader>ja",
        "<cmd>Neorg journal today<cr>",
        opts = { desc = "Allez à aujourd'hui" },
      },
      { -- tomorrow page
        "<localleader>jd",
        "<cmd>Neorg journal tomorrow<cr>",
        opts = { desc = "Allez à demain" },
      },
      { -- Yesterday page
        "<localleader>jh",
        "<cmd>Neorg journal yesterday<cr>",
        opts = { desc = "Allez à hier" },
      },
      { -- Go to custom date
        "<localleader>jc",
        "<cmd>Neorg journal custom<cr>",
        opts = { desc = "Voir le calendrier" },
      },
      { -- Update toc
        "<localleader>jtu",
        "<cmd>Neorg journal toc update<cr>",
        opts = { desc = "Mettre à jours l'index" },
      },
      { -- Go to toc
        "<localleader>jto",
        "<cmd>Neorg journal toc open<cr>",
        opts = { desc = "Allez à l'index" },
      },
    },
  },
  norg = {
    n = {
      {
        "<localleader>fb",
        "<cmd>Telescope neorg find_backlinks<cr>",
        opts = { desc = "Find backlinks" },
      },
      {
        "<localleader>fh",
        "<cmd>Telescope neorg find_header_backlinks<cr>",
        opts = { desc = "Find header backlings" },
      },
      {
        "<localleader>fH",
        "<cmd>Telescope neorg search_headings<cr>",
        opts = { desc = "Search heading in current file" },
      },
      {
        "<localleader>il",
        "<cmd>Telescope neorg insert_link<cr>",
        opts = { desc = "Insert link" },
      },
      {
        "<localleader>if",
        "<cmd>Telescope neorg insert_file_link<cr>",
        opts = { desc = "Insert file link" },
      },

      -- TODO --
      -- undone
      {
        "<LocalLeader>tu",
        "<Plug>(neorg.qol.todo-items.todo.task-undone)",
        opts = { desc = "Mark as Undone" },
      },

      -- pending
      {
        "<LocalLeader>tp",
        "<Plug>(neorg.qol.todo-items.todo.task-pending)",
        opts = { desc = "Mark as Pending" },
      },

      -- Mark the task under the cursor as "done"
      -- ^mark Task as Done
      {
        "<LocalLeader>td",
        "<Plug>(neorg.qol.todo-items.todo.task-done)",
        opts = { desc = "Mark as Done" },
      },

      -- Mark the task under the cursor as "on-hold"
      -- ^mark Task as on Hold
      {
        "<LocalLeader>th",
        "<Plug>(neorg.qol.todo-items.todo.task-on-hold)",
        opts = { desc = "Mark as On Hold" },
      },

      -- Mark the task under the cursor as "cancelled"
      -- ^mark Task as Cancelled
      {
        "<LocalLeader>tc",
        "<Plug>(neorg.qol.todo-items.todo.task-cancelled)",
        opts = { desc = "Mark as Cancelled" },
      },

      -- Mark the task under the cursor as "recurring"
      -- ^mark Task as Recurring
      {
        "<LocalLeader>tr",
        "<Plug>(neorg.qol.todo-items.todo.task-recurring)",
        opts = { desc = "Mark as Recurring" },
      },

      -- Mark the task under the cursor as "important"
      -- ^mark Task as Important
      {
        "<LocalLeader>ti",
        "<Plug>(neorg.qol.todo-items.todo.task-important)",
        opts = { desc = "Mark as Important" },
      },

      -- Mark the task under the cursor as "ambiguous"
      -- ^mark Task as Ambiguous
      {
        "<LocalLeader>ta",
        "<Plug>(neorg.qol.todo-items.todo.task-ambiguous)",
        opts = { desc = "Mark as Ambigous" },
      },

      -- Switch the task under the cursor between a select few states
      {
        "<C-Space>",
        "<Plug>(neorg.qol.todo-items.todo.task-cycle)",
        opts = { desc = "Cycle Task" },
      },

      -- HOP --
      -- Hop to the destination of the link under the cursor
      { "<CR>", "<Plug>(neorg.esupports.hop.hop-link)", opts = { desc = "Jump to Link" } },

      -- Same as `<CR>`, except open the destination in a vertical split
      {
        "<M-CR>",
        "<Plug>(neorg.esupports.hop.hop-link.vsplit)",
        opts = { desc = "Jump to Link (Vertical Split)" },
      },

      -- Promote an object non-recursively
      {
        "».",
        "<Plug>(neorg.promo.promote)",
        opts = { desc = "Promote Object (Non-Recursively)" },
      },
      -- Demote an object non-recursively
      {
        "«.",
        "<Plug>(neorg.promo.demote)",
        opts = { desc = "Demote Object (Non-Recursively)" },
      },

      -- Promote an object recursively
      {
        "»»",
        "<Plug>(neorg.promo.promote.nested)",
        opts = { desc = "Promote Object (Recursively)" },
      },
      -- Demote an object recursively
      {
        "««",
        "<Plug>(neorg.promo.demote.nested)",
        opts = { desc = "Demote Object (Recursively)" },
      },

      -- Toggle a list from ordered <-> unordered
      -- ^List Toggle
      {
        "<LocalLeader>lt",
        "<Plug>(neorg.pivot.list.toggle)",
        opts = { desc = "Toggle (Un)ordered List" },
      },

      -- Invert all items in a list
      -- Unlike `<LocalLeader>lt`, inverting a list will respect mixed list
      -- items, instead of snapping all list types to a single one.
      -- ^List Invert
      {
        "<LocalLeader>li",
        "<Plug>(neorg.pivot.list.invert)",
        opts = { desc = "Invert (Un)ordered List" },
      },

      -- Insert a link to a date at the given position
      -- ^Insert Date
      {
        "<LocalLeader>id",
        "<Plug>(neorg.tempus.insert-date)",
        opts = { desc = "Insert Date" },
      },

      -- Magnifies a code block to a separate buffer.
      -- ^Code Magnify
      {
        "<LocalLeader>cm",
        "<Plug>(neorg.looking-glass.magnify-code-block)",
        opts = { desc = "Magnify Code Block" },
      },
    },
    i = {
      {
        "<M-l>",
        "<cmd>Telescope neorg insert_link<cr>",
        opts = { desc = "Insert link" },
      },
      {
        "<M-f>",
        "<cmd>Telescope neorg insert_file_link<cr>",
        opts = { desc = "Insert file link" },
      },
      -- Promote an object recursively
      {
        "<C-t>",
        "<Plug>(neorg.promo.promote)",
        opts = { desc = "Promote Object (Recursively)" },
      },

      -- Demote an object recursively
      {
        "<C-d>",
        "<Plug>(neorg.promo.demote)",
        opts = { desc = "Demote Object (Recursively)" },
      },

      -- Create an iteration of e.g. a list item
      {
        "<M-CR>",
        "<Plug>(neorg.itero.next-iteration)",
        opts = { desc = "Continue Object" },
      },

      -- Insert a link to a date at the current cursor position
      -- ^Date
      {
        "<M-d>",
        "<Plug>(neorg.tempus.insert-date.insert-mode)",
        opts = { desc = "Insert Date" },
      },
    },
    v = {
      -- Promote objects in range
      {
        "»",
        "<Plug>(neorg.promo.promote.range)",
        opts = { desc = "Promote Objects in Range" },
      },
      -- Demote objects in range
      {
        "«",
        "<Plug>(neorg.promo.demote.range)",
        opts = { desc = "Demote Objects in Range" },
      },
    },
  },
}

function M.setup()
  set_keys_for(false, preset.all)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "norg",
    callback = function(ev)
      set_keys_for(ev.buf, preset.norg)
    end,
  })

  wk.add({
    {
      "<localleader>c",
      group = "Code",
    },
    {
      "<localleader>j",
      group = "Journal",
    },
    {
      "<localleader>jt",
      group = "Toc",
    },

    {
      "<localleader>i",
      group = "Insert",
    },
    {
      "<localleader>t",
      group = "Tasks",
    },
    {
      "<localleader>n",
      group = "Notes",
    },

    {
      "<localleader>l",
      group = "Lists",
    },
    {
      "<localleader>f",
      group = "Search",
    },
    {
      "<localleader>t",
      group = "Tasks",
    },
  })
end

return M
