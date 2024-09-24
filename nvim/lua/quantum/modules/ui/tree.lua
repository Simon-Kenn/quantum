local M = {}
local events = require("neo-tree.events")
local border = require("quantum.modules.ui.utils").border

function M.setup()
  require("neo-tree").setup({
    source_selector = {
      winbar = true,
      separator = "",
      content_layout = "center",
      truncation_character = "",
      sources = {
        { source = "filesystem", display_name = "󱉭 Files" },
        { source = "buffers", display_name = " Buffers" },
        { source = "git_status", display_name = "󰊢 Git" },
      },
    },
    close_if_last_window = true,
    use_default_mappings = false,
    popup_border_style = border,
    event_handlers = {
      {
        event = events.FILE_OPENED,
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
    default_components_configs = {
      icon = {
        folder_closed = "󰉋",
        folder_open = "󰝰",
        folder_empty = "󰉖",
        folder_empty_open = "󰷏",
        default = "󰡯",
      },
      modified = { symbol = "●" },
      name = {
        trailing_slash = false,
        highlight_opened_files = true,
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          added = " ", --    󰐖 󰐗 󰜄
          modified = " ", --    󱗜 󰏬 󰛿 󰏭 󰝶 󱗝
          deleted = " ", --    󰍵 󰍶 󰛲
          renamed = " ", --  󰜵 󰁖 󰜶
          ignored = " ", --      slash

          untracked = " ", --   󰻂 󰎒 󰩳 󰓏  󰩴 󰦤 
          unstaged = " ", --  󰒉   󰄲 󰏝 󰄱 󰙀 󰔌   󰆟
          staged = " ", --        󰗠 󰽢 󰏝 󰄲 󰱒 󰆟
          conflict = "󰅗 ", --        󰅗 󰅙
        },
      },
    },
    window = {
      position = "left",
      width = 35,
      mappings = {
        ["l"] = "open",
        ["L"] = "open",
        ["<CR>"] = "open",

        ["c"] = "close_node",

        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["F"] = "focus_preview",
        ["<Esc>"] = "cancel",

        ["v"] = "open_vsplit",
        ["h"] = "open_split",

        ["R"] = "refresh",
        ["a"] = { "add", config = { show_path = "relative", insert_as = "sibling" } },
        ["A"] = { "add", config = { show_path = "relative", insert_as = "child" } },
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",

        ["cf"] = "copy_filename",
        ["cp"] = "copy_path",

        ["[b"] = "prev_source",
        ["]b"] = "next_source",

        ["z"] = "close_all_nodes",
        ["Z"] = "expand_all_nodes",

        ["<C-d>"] = { "scroll_preview", config = { direction = -4 } },
        ["<C-u>"] = { "scroll_preview", config = { direction = 4 } },

        ["e"] = "toggle_auto_expand_width",
        ["q"] = "close_window",
        ["?"] = "show_help",
      },
      filesystem = {
        window = {
          mappings = {
            ["."] = "toggle_hidden",

            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["#"] = "fuzzy_sorter",

            -- ["f"] = "filter_on_submit",
            -- ["F"] = "clear_filter",

            --            ["ff"] = "telescope_find",
            --           ["fg"] = "telescope_grep",

            ["<C-d>"] = "navigate_up",
            -- ["."] = "set_root",

            --          ["[g"] = "prev_git_modified",
            --         ["]g"] = "next_git_modified",
          },
        },
        follow_current_file = { enabled = true },
      },
    },
  })
end

return M
