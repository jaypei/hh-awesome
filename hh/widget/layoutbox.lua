local beautiful    = require("beautiful")
local awful        = require("awful")
local wibox        = require("wibox")

-- Create a textbox widget which will contains a short string representing the
-- layout we're using.  We need one layoutbox per screen.

local result = {}

-- Writes a string representation of the current layout in a textbox widget
function updatelayoutbox(layout, s)
  local screen = s or 1
  local txt_l = beautiful["layout_txt_" .. awful.layout.getname(awful.layout.get(screen))] or ""
  layout:set_text(txt_l)
end

for s = 1, screen.count() do
  result[s] = {}
  result[s].widget = wibox.widget.textbox(
    beautiful["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
  awful.tag.attached_connect_signal(
    s, "property::selected", function ()
      updatelayoutbox(result[s].widget, s)
  end)
  awful.tag.attached_connect_signal(
    s, "property::layout", function ()
      updatelayoutbox(result[s].widget, s)
  end)
  result[s].widget:buttons(
    awful.util.table.join(
      awful.button({}, 1, function() awful.layout.inc(tag.layouts, 1) end),
      awful.button({}, 3, function() awful.layout.inc(tag.layouts, -1) end),
      awful.button({}, 4, function() awful.layout.inc(tag.layouts, 1) end),
      awful.button({}, 5, function() awful.layout.inc(tag.layouts, -1) end)))
end

return result
