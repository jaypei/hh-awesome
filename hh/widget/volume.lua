local awful     = require("awful")
local lain      = require("lain")
local markup    = require("hh.widget.markup").markup
local wibox     = require("wibox")
local beautiful = require("beautiful")

-- ALSA volume
volicon = wibox.widget.imagebox(beautiful.widget_vol)
volumewidget = lain.widgets.alsa({
    settings = function()
      local txt = ""
      if volume_now.status == "off" then
        txt = "mute"
      else
        txt = volume_now.level .. "%"
      end
      widget:set_markup(markup("#7493d2", txt .. " "))
    end
})

return {
  icon = volicon,
  widget = volumewidget
}
