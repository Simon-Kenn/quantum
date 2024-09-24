local M = {}
local banner = require('quantum.modules.ui.utils').banner
banner = string.rep('\n', 7) .. banner .. '\n'

function M.setup()
  require('dashboard').setup {
    theme = 'doom',
    hide = {
      statusline = false,
      tabline = false,
      winbar = false,
    },
    config = {
      header = vim.split(banner, '\n'),
      -- TODO: should be more personalized, CerveauII, Journal, New Note, Agenda, Fondation, Quantum, other project
      center = {
        { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'n', icon_hl = 'Character' },
        { action = 'Telescope find_files', desc = ' Find file', icon = ' ', key = 'f', icon_hl = 'Label' },
        { action = 'Telescope live_grep', desc = ' Find text', icon = ' ', key = 'g', icon_hl = 'Special' },
        { action = 'Telescope oldfiles', desc = ' Recent files', icon = ' ', key = 'r', icon_hl = 'Macro' },
        { action = 'qa', desc = ' Quit', icon = ' ', key = 'q', icon_hl = 'Error' },
      },
      -- TODO: This should send random citation from my zettelkasten
      footer = function()
        return {
          "L'injustice ne se trouve jamais dans les droits inégaux, elle se trouve dans la prétention à des droits égaux.",
        }
      end,
    },
  }
end

return M
