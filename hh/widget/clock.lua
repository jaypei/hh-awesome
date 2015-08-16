local awful        = require("awful")
local lain         = require("lain")
local mytextclock = awful.widget.textclock("%Y-%m-%d %H:%M")

-- Calendar
lain.widgets.calendar:attach(mytextclock)

return {
  widget = mytextclock
}
