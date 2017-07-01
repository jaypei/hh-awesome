local awful     = require("awful")
local lain      = require("lain")
local markup    = require("hh.widget.markup").markup
local wibox     = require("wibox")
local beautiful = require("beautiful")
local config    = require("etc/config")
local sexec     = require("hh.util").sexec

blue   = beautiful.fg_focus
red    = "#EB8F8F"
green  = "#8FEB8F"

terminal = config.terminal

volicon = wibox.widget.imagebox(beautiful.vol)
volume = lain.widget.alsabar({width = 55, ticks = true, ticks_size = 6, step = "2%",
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

volumewidget:buttons(
  awful.util.table.join(
    awful.button({}, 1, function ()
        sexec ("amixer sset Master toggle-mute >/dev/null")
        sexec ("amixer sset Speaker unmute >/dev/null")
        volume.update()
    end),
    awful.button({}, 4, function ()
        sexec("amixer set Master 5%+ >/dev/null")
        volume.update()
    end),
    awful.button({}, 5, function ()
        sexec("amixer set Master 5%- >/dev/null")
        volume.update()
    end)))


return {
  icon = volicon,
  widget = volumewidget
}

