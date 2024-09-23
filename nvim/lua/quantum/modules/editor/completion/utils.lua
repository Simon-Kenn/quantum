local M = {}

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

M.confirm_selection = function(fallback, ls, cmp)
  if cmp.visible() then
    if ls.expandable() then
      ls.expand()
    else
      cmp.confirm {
        select = true,
      }
    end
  else
    fallback()
  end
end

M.next_item = function(fallback, ls, cmp)
  if cmp.visible() then
    cmp.select_next_item()
  elseif ls.locally_jumpable(1) then
    ls.jump(1)
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

M.prev_item = function(fallback, cmp, ls)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif ls.locally_jumpable(-1) then
    ls.jump(-1) -- FIX: This don't work, need further investigation
  else
    fallback()
  end
end

return M
