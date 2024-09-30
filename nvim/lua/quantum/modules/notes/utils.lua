local M = {}

local function get_current_week(year, month, day)
  local timestamp = os.time({ year = year, month = month, day = day })

  local week_number = tonumber(os.date("%W", timestamp)) + 1
  return week_number
end

local function get_current_quarter(month)
  local current_quarter

  if month <= 3 then
    current_quarter = 1
  elseif month <= 6 then
    current_quarter = 2
  elseif month <= 9 then
    current_quarter = 3
  else
    current_quarter = 4
  end

  return current_quarter
end

M.toc_format = function(entries)
  local output = {}
  local current_year
  local current_quarter
  local last_quarter
  local current_month
  local current_week
  local last_week

  for _, entry in ipairs(entries) do
    -- Don't print the year if it hasn't changed
    if not current_year or current_year < entry[1] then
      current_year = entry[1]
      current_month = nil
      table.insert(output, "* " .. current_year)
    end

    -- Check to which quarter the current month corresponds to
    current_quarter = get_current_quarter(entry[2])
    current_week = get_current_week(entry[1], entry[2], entry[3])

    -- If the current month corresponds to another quarter, print it
    if current_quarter ~= last_quarter then
      table.insert(output, "** Trimestre " .. current_quarter)
      last_quarter = current_quarter
    end

    -- Don't print the month if it hasn't changed
    if not current_month or current_month < entry[2] then
      current_month = entry[2]
      table.insert(output, "*** Mois " .. current_month)
    end

    -- Prints the file link
    table.insert(output, "- " .. entry[4] .. string.format("[%s]", entry[5]))
  end

  return output
end

return M
