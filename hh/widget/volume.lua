local awful     = require("awful")
local lain      = require("lain")
local markup    = require("hh.widget.markup").markup
local wibox     = require("wibox")
local beautiful = require("beautiful")
local config    = require("etc/config")

blue   = beautiful.fg_focus
red    = "#EB8F8F"
green  = "#8FEB8F"

terminal = config.terminal

volicon = wibox.widget.imagebox(beautiful.vol)
volume = lain.widget.alsabar({width = 55, ticks = true, ticks_size = 6, step = "2%",
settings = function()
    if volume_now.status == "off" then
        volicon:set_image(beautiful.vol_mute)
    elseif volume_now.level == 0 then
        volicon:set_image(beautiful.vol_no)
    elseif volume_now.level <= 50 then
        volicon:set_image(beautiful.vol_low)
    else
        volicon:set_image(beautiful.vol)
    end
end,
colors =
{
    background = beautiful.bg_normal,
    mute = red,
    unmute = beautiful.fg_normal
}})
volmargin = wibox.container.margin(volume.bar, 2, 7)
volmargin:set_top(6)
volmargin:set_bottom(6)
volumewidget = wibox.container.background(volmargin)
volumewidget:set_bgimage(beautiful.widget_bg)

return {
  icon = volicon,
  widget = volumewidget
}

