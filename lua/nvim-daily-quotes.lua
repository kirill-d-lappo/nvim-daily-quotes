local M = {}

local quotes = require("quote-lines")

--- Returns quote index according to selected day
---@param day_of_year integer
---@return string
local function get_quote(day_of_year)
  local month_group_size = 31
  local quotes_len = #quotes

  local month_numbers = math.floor(quotes_len / month_group_size)
  local month_number = math.random(month_numbers)
  local month_index = month_number - 1;

  local month_index_group_size = month_group_size
  if month_number == month_numbers then
    month_group_size = quotes_len % month_group_size
  end
  if month_index_group_size <= 0 then
    month_group_size = month_group_size
  end

  local day_offset = day_of_year % month_group_size;

  local index = month_index * month_group_size + day_offset

  return quotes[index]
end

--- Returns quote of a day
---@return string
function M.get_qod()
  local day = os.date("*t").day
  return get_quote(day)
end

return M
