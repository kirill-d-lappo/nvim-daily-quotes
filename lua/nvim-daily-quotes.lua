local M = {}

local quotes = require("quote-lines")

--- Returns quote according to selected day
---@param day_of_year integer
---@return string
local function get_quote(day_of_year)
  local quotes_len = #quotes

  local index = day_of_year
  if (index >= quotes_len) then
    index = day_of_year % quotes_len
  end

  return quotes[index]
end

--- Returns quote of a day
---@return string
function M.get_qod()
  local day = os.date("*t").day
  return get_quote(day)
end

return M
