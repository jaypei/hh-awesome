local wibox        = require("wibox")

-- Create a textbox widget which will contains a short string representing the
-- layout we're using.  We need one layoutbox per screen.

local result = {}
local txt = ""

for s = 1, screen.count() do
  txt = "[SC:" .. s .. "]"
  result[s] = {}
  result[s].widget = wibox.widget.textbox(txt)
end

return result
