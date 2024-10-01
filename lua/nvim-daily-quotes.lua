local M = {}

local quotes = require("quote-lines")

--- Returns quote index according to selected day
---@param day integer
---@return string
local function get_quote(day)
	local group_size = 32
	local groups = #quotes / group_size
	local group_index = math.random(groups)
	local index = group_index * group_size + group_size % day

	return quotes[index]
end

--- Returns quote of a day
---@return string
function M.get_qod()
	local day = os.date("*t").day
	return get_quote(day)
end

return M
