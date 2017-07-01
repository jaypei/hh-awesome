local print     = print
local wibox     = require("wibox")
local lain      = require("lain")
local markup    = require("hh.widget.markup").markup
local awful     = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local tempwidget = lain.widget.temp({
    tempfile = "/sys/class/thermal/thermal_zone1/temp",
    settings = function()
        widget:set_markup(markup.font(theme.font, coretemp_now .. "°C "))
    end
})

return {
    icon = tempicon,
    widget = tempwidget.widget
}
