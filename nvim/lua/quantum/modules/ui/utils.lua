local M = {}

M.palette = require('catppuccin.palettes').get_palette()

M.icons = {
  diagnostics = {
    error = ' ',
    warn = ' ',
    info = ' ',
    hint = ' ',
  },
  kinds = {
    Array = ' ',
    Boolean = '󰨙 ',
    Class = ' ',
    Color = ' ',
    Constant = '󰏿 ',
    Constructor = ' ',
    Enum = ' ',
    EnumMember = ' ',
    Event = ' ',
    Field = ' ',
    File = ' ',
    Folder = ' ',
    Function = '󰊕 ',
    Interface = ' ',
    Keyword = ' ',
    Method = ' ',
    Module = ' ',
    Namespace = ' ',
    Null = '󰟢 ',
    Number = '󰎠 ',
    Object = ' ',
    Operator = ' ',
    Package = ' ',
    Property = ' ',
    Reference = ' ',
    Snippet = ' ',
    String = ' ',
    Struct = ' ',
    Text = ' ',
    TypeParameter = ' ',
    Unit = ' ',
    Value = ' ',
    Variable = ' ',
    Copilot = ' ',
  },
}

M.banner = [[
________                       __                 
\_____  \  __ _______    _____/  |_ __ __  _____  
 /  / \  \|  |  \__  \  /    \   __\  |  \/     \ 
/   \_/.  \  |  // __ \|   |  \  | |  |  /  Y Y  \
\_____\ \_/____/(____  /___|  /__| |____/|__|_|  /
       \__>          \/     \/                 \/ 
]]

return M
