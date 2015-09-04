local beautiful    = require("beautiful")
local awful        = require("awful")
local wibox        = require("wibox")
local hh_tag       = require("hh.tag")

-- Create a textbox widget which will contains a short string representing the
-- layout we're using.  We need one layoutbox per screen.

local result = {}

for s = 1, screen.count() do
  result[s] = {}
  result[s].widget = awful.widget.layoutbox(s)

  result[s].widget:buttons(
    awful.util.table.join(
      awful.button({}, 1, function() awful.layout.inc(hh_tag.layouts, 1) end),
      awful.button({}, 3, function() awful.layout.inc(hh_tag.layouts, -1) end),
      awful.button({}, 4, function() awful.layout.inc(hh_tag.layouts, 1) end),
      awful.button({}, 5, function() awful.layout.inc(hh_tag.layouts, -1) end)))
end

return result
