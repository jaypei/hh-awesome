local awful     = require("awful")
local lain      = require("lain")
local markup    = require("hh.widget.markup").markup
local wibox     = require("wibox")
local beautiful = require("beautiful")

blue   = beautiful.fg_focus
red    = "#EB8F8F"
green  = "#8FEB8F"

-- Battery
baticon = wibox.widget.imagebox(beautiful.bat)
batbar = awful.widget.progressbar()
batbar:set_color(beautiful.fg_normal)
batbar:set_width(55)
batbar:set_ticks(true)
batbar:set_ticks_size(6)
batbar:set_background_color(beautiful.bg_normal)
batmargin = wibox.layout.margin(batbar, 2, 7)
batmargin:set_top(6)
batmargin:set_bottom(6)
batupd = lain.widgets.bat({
    settings = function()
      if bat_now.perc == "N/A" or bat_now.status == "Not present" then
        bat_perc = 100
        baticon:set_image(beautiful.ac)
      elseif bat_now.status == "Charging" then
        bat_perc = tonumber(bat_now.perc)
        baticon:set_image(beautiful.ac)

        if bat_perc >= 98 then
          batbar:set_color(green)
        elseif bat_perc > 50 then
          batbar:set_color(beautiful.fg_normal)
        elseif bat_perc > 15 then
          batbar:set_color(beautiful.fg_normal)
        else
          batbar:set_color(red)
        end
      else
        bat_perc = tonumber(bat_now.perc)

        if bat_perc >= 98 then
          batbar:set_color(green)
        elseif bat_perc > 50 then
          batbar:set_color(beautiful.fg_normal)
          baticon:set_image(beautiful.bat)
        elseif bat_perc > 15 then
          batbar:set_color(beautiful.fg_normal)
          baticon:set_image(beautiful.bat_low)
        else
          batbar:set_color(red)
          baticon:set_image(beautiful.bat_no)
        end
      end
      batbar:set_value(bat_perc / 100)
    end
})
batwidget = wibox.widget.background(batmargin)
batwidget:set_bgimage(beautiful.widget_bg)

return {
  icon = baticon,
  widget = batwidget
}
